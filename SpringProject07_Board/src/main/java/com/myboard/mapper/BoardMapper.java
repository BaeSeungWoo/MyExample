package com.myboard.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.myboard.dto.BoardDTO;
import com.myboard.dto.FileBoardDTO;

public interface BoardMapper {
	
	// �߰�	
	public void insert(BoardDTO board);
	// ��ü����
	public List<BoardDTO> list(HashMap<String, Object> hm);
	// �󼼺���
	public BoardDTO findbynum(int num);
	// ����
	public int getCount(HashMap<String, Object>hm);
	// ����
	public void delete(int num);
	// ����
	public void update(BoardDTO board);
	// ��� �� ����
	public void updateReplyCnt(@Param("bnum") int bnum, @Param("amount") int amount);
	// ��ȸ �� ����
    public void getReadCount(int num);
    // ���� ���ε�
 	public void fileInsert(FileBoardDTO board);
 	// ���� ����Ʈ
    public List<FileBoardDTO> fileList();
}
