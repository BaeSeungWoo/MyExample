package com.myspring.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestServiceImpl implements GuestService{
	
	@Autowired
	private GuestDAO dao;
	
	    // 추가
	    @Override
		public void guestInsert(GuestDTO guest) {
			dao.dao_guestInsert("guestInsert", guest);
		}
		// 전체보기
	    @Override
		public List<GuestDTO> guestList(HashMap<String, String>hm){
			return dao.dao_guestList("guestList", hm);
			
		}
		// 개수
	    @Override
		public int guestCount(HashMap<String, String>hm) {
			return dao.dao_guestCount("guestCount", hm);
			
		}

}
