package com.cample.model;

public class CPMemberDTO {

	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_college;

	public CPMemberDTO(String mem_id, String mem_pw, String mem_name, String mem_college) {
		super();
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_college = mem_college;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_college() {
		return mem_college;
	}

	public void setMem_college(String mem_college) {
		this.mem_college = mem_college;
	}

	@Override
	public String toString() {
		return "CPMemberDTO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_college="
				+ mem_college + "]";
	}

}
