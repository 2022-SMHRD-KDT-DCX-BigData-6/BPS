package com.cample.model;

import java.sql.Timestamp;

public class CPBoardDTO {

	
		
	private String num; 
	private String title; 
	private String writer; 
	 
	private String content; 
	
	
	
	public CPBoardDTO() {}

	public CPBoardDTO(String num, String title, String writer, String content) {
		super();
		this.num = num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		/* this.campus = campus; */
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	@Override
	public String toString() {
		return "boardDTO [num=" + num + ", title=" + title + ", writer=" + writer + ", content=" + content +"]";
	}

	
	
	
		
		
}
