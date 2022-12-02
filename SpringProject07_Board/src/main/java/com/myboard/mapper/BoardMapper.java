package com.myboard.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import com.myboard.dto.BoardDTO;
import com.myboard.dto.FileBoardDTO;

public interface BoardMapper {
	
	// 추가	
	public void insert(BoardDTO board);
	// 전체보기
	public List<BoardDTO> list(HashMap<String, Object> hm);
	// 상세보기
	public BoardDTO findbynum(int num);
	// 개수
	public int getCount(HashMap<String, Object>hm);
	// 삭제
	public void delete(int num);
	// 수정
	public void update(BoardDTO board);
	// 댓글 수 증감
	public void updateReplyCnt(@Param("bnum") int bnum, @Param("amount") int amount);
	// 조회 수 증가
    public void getReadCount(int num);
    // 파일 업로드
 	public void fileInsert(FileBoardDTO board);
 	// 파일 리스트
    public List<FileBoardDTO> fileList();
}
