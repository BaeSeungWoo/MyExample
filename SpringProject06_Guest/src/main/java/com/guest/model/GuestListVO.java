package com.guest.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter // getter 생성
@AllArgsConstructor // 모든 변수로 생성자 만듬
public class GuestListVO {
	
	private List<GuestVO> arr;
	private int count;
}
