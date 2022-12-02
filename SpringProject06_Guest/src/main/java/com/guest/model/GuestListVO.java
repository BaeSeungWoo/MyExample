package com.guest.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter // getter ����
@AllArgsConstructor // ��� ������ ������ ����
public class GuestListVO {
	
	private List<GuestVO> arr;
	private int count;
}
