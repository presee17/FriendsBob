package com.mycompany.myapp.dto;

import java.util.Date;

public class ReviewComment {
	private int rCommentNo;
	private String rCommentContent;
	private Date rCommentDate;
	private String memberId;
	private int reviewNo;
	
	public int getrCommentNo() {
		return rCommentNo;
	}
	public void setrCommentNo(int rCommentNo) {
		this.rCommentNo = rCommentNo;
	}
	public String getrCommentContent() {
		return rCommentContent;
	}
	public void setrCommentContent(String rCommentContent) {
		this.rCommentContent = rCommentContent;
	}
	public Date getrCommentDate() {
		return rCommentDate;
	}
	public void setrCommentDate(Date rCommentDate) {
		this.rCommentDate = rCommentDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
}
