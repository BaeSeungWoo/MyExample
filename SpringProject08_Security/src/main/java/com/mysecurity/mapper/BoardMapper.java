package com.mysecurity.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mysecurity.dto.BoardDTO;

public interface BoardMapper {
	
	// 추가 insert
	public void insert(BoardDTO board);
	
	// 전체보기 list
	public List<BoardDTO> list();
	
	// 상세보기 findbyNum
	@Select("select * from board where num = #{num}")
	public BoardDTO findbyNum(int num);
	// 댓글 개수 증감 updateReplyCnt()
	
	// 개수
	@Select("select count(*) from board")
	public int getCount();
	
	// 삭제
	@Delete("delete from board where num = #{num}")
	public void delete(int num);
	
	// 수정
	@Update("update board set title = #{title}, content = #{content} where num = #{num}")
	public void update(BoardDTO board);

	// 댓글 개수 증감
	@Update("update board set replycnt = replycnt+#{amount} where num = #{bnum}")
	public void updateReplyCnt(@Param("bnum")int bnum, @Param("amount")int amount);
	
}
