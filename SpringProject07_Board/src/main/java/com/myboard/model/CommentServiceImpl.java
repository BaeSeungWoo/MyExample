package com.myboard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myboard.dto.CommentDTO;
import com.myboard.mapper.BoardMapper;
import com.myboard.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentMapper mapper;
	@Autowired BoardMapper bmapper;

	@Transactional
	@Override
	public void insert(CommentDTO comment) {
		mapper.insert(comment);	 // ´ñ±Û Ãß°¡
		bmapper.updateReplyCnt(comment.getBnum(), 1); // ´ñ±Û ¼ö Áõ°¨
	}

	@Override
	public List<CommentDTO> getList(int bnum) {
		return mapper.getList(bnum);
	}

	@Transactional
	@Override
	public void delete(int cnum) {
		CommentDTO comment = mapper.read(cnum);
		bmapper.updateReplyCnt(comment.getBnum(), -1);
		mapper.delete(cnum);		
	}

}
