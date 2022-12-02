package com.mysecurity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mysecurity.dto.CommentDTO;
import com.mysecurity.mapper.BoardMapper;
import com.mysecurity.mapper.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper cmapper;
	@Autowired
	private BoardMapper bmapper;
	
	// Ãß°¡
	@Transactional
	public void insert(CommentDTO comment) {
		bmapper.updateReplyCnt(comment.getBnum(),1);
		cmapper.insert(comment);
	}
	
	public List<CommentDTO> list(int bnum) {
		return cmapper.list(bnum);
	}
	
	public int getCount(int bnum) {
		return cmapper.getCount(bnum);
	}
	
	public void delete(int cnum) {
		cmapper.delete(cnum);
	}

}
