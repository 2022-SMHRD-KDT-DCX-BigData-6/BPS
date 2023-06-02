package com.cample.model;

public class CPCommentDTO {

	private String comments;
	private String name;
	
	public CPCommentDTO() {}

	public CPCommentDTO(String comments) {
		super();
		this.comments = comments;
	}

	public String getComments() {
		return comments;
	}
	public String getName() {
		return name;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public void setName(String name) {
		this.name=name;
	}

	@Override
	public String toString() {
		return "CPCommentDTO [comments=" + comments + "]";
	}
	
	
}
