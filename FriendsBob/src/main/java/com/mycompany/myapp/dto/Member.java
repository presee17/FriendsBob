package com.mycompany.myapp.dto;

public class Member {

	private String id;
	private String password;
	private String address1;
	private String address2;
	private String nick;
	private int grade;
	private int point;
	private String retire;
	private int warning;
	private String accusation;
	
	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getWarning() {
		return warning;
	}

	public void setWarning(int warning) {
		this.warning = warning;
	}

	public String getAccusation() {
		return accusation;
	}

	public void setAccusation(String accusation) {
		this.accusation = accusation;
	}
	
	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getRetire() {
		return retire;
	}

	public void setRetire(String retire) {
		this.retire = retire;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}