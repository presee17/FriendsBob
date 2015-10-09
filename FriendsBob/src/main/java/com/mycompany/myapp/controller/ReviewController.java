package com.mycompany.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Review;
import com.mycompany.myapp.service.ReviewService;



@Controller
public class ReviewController {

	
		@Autowired
		private ReviewService reviewService;
		
		@RequestMapping(value="/Review/write",method=RequestMethod.GET)
		public String reviewForm() {
			return "Review/reviewForm";
		}
		
		@RequestMapping(value="/Review/write",method=RequestMethod.POST)	
		public String review(Review review, HttpSession session) {	
			Member member=(Member)session.getAttribute("Member");
			//데이터 베이스에 게시물 정보 저장
			reviewService.add(review,member);
			
			return "redirect:/Review/reviewList";
		}
		
		@RequestMapping("/Review/reviewList")
		public String list(
				@RequestParam(value="pageNo", defaultValue="1") int pageNo, 
				Model model, 
				HttpSession session) {
			
			
			session.setAttribute("pageNo", pageNo);
			
			int rowsPerPage = 10;
			int pagesPerGroup = 5;
					
			//전체 게시물 수
			int totalBoardNo = reviewService.getTotalReviewNo();
			
			//전체 페이지 수
			int totalPageNo = totalBoardNo/rowsPerPage;
			if(totalBoardNo%rowsPerPage != 0) { totalPageNo++; }
			
			//전체 그룹 수
			int totalGroupNo = totalPageNo / pagesPerGroup;
			if(totalPageNo%pagesPerGroup != 0) { totalGroupNo++; }
			
			//현재 그룹번호, 시작페이지번호, 끝페이지번호
			int groupNo = (pageNo-1)/pagesPerGroup + 1;
			int startPageNo = (groupNo-1)*pagesPerGroup + 1;
			int endPageNo = startPageNo + pagesPerGroup - 1;
			if(groupNo==totalGroupNo) { endPageNo = totalPageNo; }
			
			//현재 페이지 게시물 리스트
			List<Review> list = reviewService.getPage(pageNo, rowsPerPage);
			
			//View로 넘길 데이터
			model.addAttribute("pagesPerGroup", pagesPerGroup);
			model.addAttribute("totalPageNo", totalPageNo);
			model.addAttribute("totalGroupNo", totalGroupNo);
			model.addAttribute("groupNo", groupNo);
			model.addAttribute("startPageNo", startPageNo);
			model.addAttribute("endPageNo", endPageNo);
			model.addAttribute("pageNo", pageNo);
			model.addAttribute("list", list);
			
			return "Review/reviewList";
		}

		@RequestMapping("/Review/reviewDetail")
		public String detail(int reviewNo, Model model) {
			
			Review review = reviewService.getReview(reviewNo);
			model.addAttribute("review", review);
			return "Review/reviewDetail";
		}
		
		@RequestMapping("/Review/reviewForm")
		public String updateForm(@RequestParam("reviewNo") int reviewNo, Model model) {
			Review review= reviewService.getReview(reviewNo);
			model.addAttribute("review", review);
			return "Review/reviewUpdateForm";
		}
		
		@RequestMapping("/Review/reviewUpdate")
		public String update(Review review) {
			reviewService.modify(review);
			return "redirect:/Review/reviewDetail?boardNo="+review.getReviewNo();
		}
		
		@RequestMapping("/review/delete/{reviewNo}")
		public String delete(@PathVariable int reviewNo) {
			reviewService.remove(reviewNo);
			return "redirect:/Review/reviewList";
		}


		
	
}
