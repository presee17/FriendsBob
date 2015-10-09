package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.ReviewDao;
import com.mycompany.myapp.dto.Meeting;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Review;

@Component
public class ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	public void add(Review review, Member member){
		reviewDao.insert(review, member);
		
	}
	public List<Review> getPage(int pageNo, int rowsPerPage){
		List<Review> list = reviewDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	public Review getReview(int reviewNo){
		Review review = reviewDao.selectByPk(reviewNo);
		return review;
	}
	public void modify(Review review){
		reviewDao.update(review);
	}
	public void remove(int reviewNo){
		reviewDao.delete(reviewNo);
	}
	public int getTotalReviewNo(){
		int rows = reviewDao.selectCount();
		return rows;
	}
}
