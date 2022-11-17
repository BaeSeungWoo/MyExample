package com.board.model;

import java.util.ArrayList;

public interface SBoardDAO {
	// �߰�
	public void boardInsert(BoardDTO board);
	
	// ����
	public void boardUpdate(BoardDTO board);
	
	// ��ü����
	public ArrayList<BoardDTO> boardList();
	public ArrayList<BoardDTO> boardList(int startRow, int endRow, String field, String word);
	
	// ����
	public void boardDelete(int num);
	
	// �Խñ� ��
	public int boardCount(String field, String word);
	
	// �󼼺���
	public BoardDTO findByNum(int num);
	
	// comment
	
	// comment �߰�
	public void commentInsert(CommentDTO comment);
	
	// comment ��ü����
	public ArrayList<CommentDTO> findAllComment(int num);
	
	// comment ��� ����
	public int commentCount(int bnum);
	
	// comment �Խñ� ��
		
	// comment �󼼺���

}
