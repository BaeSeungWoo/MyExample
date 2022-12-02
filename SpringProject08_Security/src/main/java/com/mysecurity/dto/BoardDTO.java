package com.mysecurity.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	
	private int num;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private String hitcount;
	private String replycnt;

}
