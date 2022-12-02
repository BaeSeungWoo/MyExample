package com.myboard.app07;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myboard.dto.CommentDTO;
import com.myboard.dto.MemberDTO;
import com.myboard.model.CommentService;

@RequestMapping("/reply/*")
@RestController // @Controller + @ResponseBody
public class CommentController {

	@Autowired
	private CommentService service;
    
	// ¥Ò±€ √ﬂ∞°
	@PostMapping("commentInsert")
	// @ResponseBody
	public String insert(@RequestBody CommentDTO comment, HttpSession session) {		
		String userid =  ((MemberDTO)session.getAttribute("sMember")).getId();
		comment.setUserid(userid);
		service.insert(comment);
		return "success";
	}

	// ¥Ò±€ ¿¸√º∫∏±‚
	@GetMapping("commentList/{bnum}")
	public List<CommentDTO> getList(@PathVariable int bnum) {
		return service.getList(bnum);
	}
	 // ¥Ò±€ ªË¡¶
	@DeleteMapping("delete/{cnum}")
	public int delete(@PathVariable int cnum) {
		service.delete(cnum);
		return cnum;
	}

	/*
	 * @GetMapping("commentList") // @ResponseBody public List<CommentDTO> list(int
	 * bnum) { return service.getList(bnum); }
	 */

}
