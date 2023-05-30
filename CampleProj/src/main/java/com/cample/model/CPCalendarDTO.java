package com.cample.model;

public class CPCalendarDTO {

	private String calendar_title;
	private String calendar_start;
	private String calendar_end;
	private String calendar_id;
	
	public CPCalendarDTO(String calendar_title, String calendar_start, String calendar_end, String calendar_id) {
		super();
		this.calendar_title = calendar_title;
		this.calendar_start = calendar_start;
		this.calendar_end = calendar_end;
		this.calendar_id = calendar_id;
	}

	public CPCalendarDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_start() {
		return calendar_start;
	}

	public void setCalendar_start(String calendar_start) {
		this.calendar_start = calendar_start;
	}

	public String getCalendar_end() {
		return calendar_end;
	}

	public void setCalendar_end(String calendar_end) {
		this.calendar_end = calendar_end;
	}

	public String getCalendar_id() {
		return calendar_id;
	}

	public void setCalendar_id(String calendar_id) {
		this.calendar_id = calendar_id;
	}

	@Override
	public String toString() {
		return "CPCalendarDTO [calendar_title=" + calendar_title + ", calendar_start=" + calendar_start
				+ ", calendar_end=" + calendar_end + ", calendar_id=" + calendar_id + "]";
	}

	

}
