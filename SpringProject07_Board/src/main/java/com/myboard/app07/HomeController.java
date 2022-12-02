package com.myboard.app07;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myboard.dto.BoardDTO;
import com.myboard.dto.PageVO;
import com.myboard.model.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private BoardService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * 
	 * 
	 * return "boardInsert"; }
	 */
	@GetMapping("insert")
	public String insert(HttpSession session) {
		if(session.getAttribute("sMember") == null) {
			return "member/login";
		}
		return "boardInsert";
	}

	@PostMapping("insert")
	public String insert(BoardDTO board) {
		service.insert(board);
		return "redirect:list";
	}

	@GetMapping({ "/", "list" })
	public String list(Model model, String pageNum, 
			@RequestParam(name = "field", defaultValue = "") String field, 
			@RequestParam(name = "word", defaultValue = "")String word) {
		int currentPage = pageNum == null?1 : Integer.parseInt(pageNum);
		int pageSize = 5;
		
		HashMap<String, Object> hm = new HashMap<String, Object> ();
		hm.put("field", field);
		hm.put("word", word);
		hm.put("pageStart", (currentPage-1)*pageSize);
		hm.put("pageSize", pageSize);
		List<BoardDTO> arr = service.findAll(hm);
		int count = service.getCount(hm);
		PageVO page = new PageVO(count, currentPage, pageSize);	
		page.setField(field);
		page.setWord(word);
		model.addAttribute("rowNo", count-(currentPage-1)*pageSize);
		model.addAttribute("count", count);
		model.addAttribute("board", arr);
		model.addAttribute("p", page);
		return "boardList";
	}

	@GetMapping("view/{num}")
	public String view(@PathVariable int num, HttpServletRequest request, Model model) {
		BoardDTO view = service.findByNum(num);
		service.getReadCount(num);
		model.addAttribute("view", view);
		return "boardView";
	}

	/*
	 * @GetMapping("delete/{num}") public String delete(@PathVariable int num) {
	 * service.delete(num); return "redirect:/list"; }
	 */

	@DeleteMapping("delete/{num}")
	@ResponseBody
	public String delete(@PathVariable int num) {
		service.delete(num);
		return "success";
	}

	@GetMapping("update/{num}")
	public String update(@PathVariable int num, Model model) {
		BoardDTO board = service.findByNum(num);
		model.addAttribute("board", board);
		return "boardUpdate";
	}
	
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody BoardDTO board) {
		service.update(board);
		return "success";
	}

}
