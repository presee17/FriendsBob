package com.mycompany.myapp.dto;

import java.util.Date;

public class MatjibComment {
	private int no;
	private Date date;
	private String content;
	private int matjibNo;
	private String id;
	
	
	public int getMatjibNo() {
		return matjibNo;
	}
	public void setMatjibNo(int matjibNo) {
		this.matjibNo = matjibNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
