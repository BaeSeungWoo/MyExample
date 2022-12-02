package com.myboard.mapper;

import com.myboard.dto.MemberDTO;

public interface MemberMapper {
	
	public void join(MemberDTO member);
	
	public int idCheck(String id);
	
	public MemberDTO loginCheck(String id);
	
	public void update(MemberDTO member);

}
