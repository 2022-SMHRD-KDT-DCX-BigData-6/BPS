package com.cample.model;

public class CPProjectDTO {

	private String id;
	private String status;
	private String content;
	private String writer;
	
	public CPProjectDTO() {}

	public CPProjectDTO(String id, String status, String content, String writer) {
		super();
		this.id = id;
		this.status = status;
		this.content = content;
		this.writer = writer;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "CPProjectDTO [id=" + id + ", status=" + status + ", content=" + content + ", writer=" + writer + "]";
	}
	
	
}
