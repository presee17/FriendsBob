package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.ReviewCommentDao;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.ReviewComment;

@Component
public class ReviewCommentService {
	
	@Autowired
	private ReviewCommentDao reviewCommentDao;
	
	public void add(ReviewComment reviewComment, Member member){
		reviewCommentDao.insert(reviewComment,member);
		
	}
	public List<ReviewComment> getComment(int reviewNo){
		System.out.println("실행되나"+reviewNo);
		List<ReviewComment> list = reviewCommentDao.selectByReviewNo(reviewNo);
		
		return list;
	}
	public void modify(ReviewComment reviewComment, Member member){
		reviewCommentDao.update(reviewComment);
		
	}
	public void remove(ReviewComment reviewComment, Member member){
		reviewCommentDao.delete(reviewComment.getrCommentNo());
	}
}