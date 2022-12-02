package com.myboard.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.dto.MemberDTO;
import com.myboard.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public void join(MemberDTO member) {
		mapper.join(member);		
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public MemberDTO loginCheck(String id) {
		return mapper.loginCheck(id);
	}

	@Override
	public void update(MemberDTO member) {
		mapper.update(member);		
	}

}
