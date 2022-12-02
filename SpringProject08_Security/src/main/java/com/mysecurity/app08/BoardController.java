package com.mysecurity.app08;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysecurity.dto.BoardDTO;
import com.mysecurity.service.BoardService;


@RequestMapping("/board/*")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService bservice;
	
	@GetMapping("insert")
	@PreAuthorize("isAuthenticated()")
	public void insert() {
		
	}
	
	@PostMapping("insert")
	public String insert(BoardDTO board) {	
		bservice.insert(board);
		return "redirect:list";
	}
	
	@GetMapping("list")
	public String list(BoardDTO board, Model model) {		
		List<BoardDTO> arr = bservice.list();
		model.addAttribute("count", bservice.getCount());
		model.addAttribute("board", arr);
		return "board/list";
	}
	
	@GetMapping("view/{num}")
	public String view(Model model, @PathVariable int num) {
		model.addAttribute("view", bservice.findByNum(num));
		return "board/view";
	}
	
	@GetMapping("update/{num}")
	public String update(Model model, @PathVariable int num) {
		BoardDTO board = bservice.findByNum(num);
		model.addAttribute("board", board);
		return "board/update";
	}
	
	@PutMapping("update")
	@ResponseBody
	public String update(@RequestBody BoardDTO board) {
		bservice.update(board);
		return "success";
	}
	
	@DeleteMapping("delete/{num}")
	@ResponseBody
	public String delete(@PathVariable int num) {
		bservice.delete(num);
		return "success";
	}

}
