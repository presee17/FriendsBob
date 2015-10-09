package com.mycompany.myapp.dto;

import java.util.Date;

public class MeetingList {
	private int no;
	private String meetingNo;
	private String writer;
	private String content;
	private Date date;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMeetingNo() {
		return meetingNo;
	}
	public void setMeetingNo(String meetingNo) {
		this.meetingNo = meetingNo;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
