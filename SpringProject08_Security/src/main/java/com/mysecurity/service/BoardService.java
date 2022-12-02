package com.mysecurity.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysecurity.dto.BoardDTO;
import com.mysecurity.mapper.BoardMapper;

@Service
public class BoardService {
	
	@Autowired
	private BoardMapper bmapper;
		
	// �߰�
	public void insert(BoardDTO board) {
		bmapper.insert(board);
	};
	// ��ü����
	public List<BoardDTO> list(){
		return bmapper.list();
	}
	// �󼼺���
	public BoardDTO findByNum(int num) {
		return bmapper.findbyNum(num);
	}
	// ����
	public int getCount() {
		return bmapper.getCount();
	}
	// ����
	public void delete(int num) {
		bmapper.delete(num);
	}
	// ����
	public void update(BoardDTO board) {
		bmapper.update(board);
	}
	// ��� ���� ����

	

}
