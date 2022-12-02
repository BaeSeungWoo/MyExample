package com.mysecurity.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mysecurity.dto.BoardDTO;

public interface BoardMapper {
	
	// �߰� insert
	public void insert(BoardDTO board);
	
	// ��ü���� list
	public List<BoardDTO> list();
	
	// �󼼺��� findbyNum
	@Select("select * from board where num = #{num}")
	public BoardDTO findbyNum(int num);
	// ��� ���� ���� updateReplyCnt()
	
	// ����
	@Select("select count(*) from board")
	public int getCount();
	
	// ����
	@Delete("delete from board where num = #{num}")
	public void delete(int num);
	
	// ����
	@Update("update board set title = #{title}, content = #{content} where num = #{num}")
	public void update(BoardDTO board);

	// ��� ���� ����
	@Update("update board set replycnt = replycnt+#{amount} where num = #{bnum}")
	public void updateReplyCnt(@Param("bnum")int bnum, @Param("amount")int amount);
	
}
