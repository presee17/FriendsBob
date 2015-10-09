package com.mycompany.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.ReviewCommentDao;
import com.mycompany.myapp.dto.Meeting;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.ReviewComment;

@Component
public class ReviewCommentService {
	
	@Autowired
	private ReviewCommentDao reviewCommentDao;
	
	public void add(ReviewComment reviewComment, Member member){
		reviewCommentDao.insert(reviewComment,member);
		
	}
	public void modify(ReviewComment reviewComment, Member member){
		reviewCommentDao.update(reviewComment);
		
	}
	public void remove(ReviewComment reviewComment, Member member){
		reviewCommentDao.delete(reviewComment.getrCommentNo());
	}
}