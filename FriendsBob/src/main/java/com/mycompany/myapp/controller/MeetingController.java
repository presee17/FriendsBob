package com.mycompany.myapp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.dto.Meeting;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Search;
import com.mycompany.myapp.service.MeetingService;

@Controller
public class MeetingController {

	@Autowired MeetingService meetingService;
	
	@RequestMapping("Meeting/meetingMain")
	public String meetingMain(Member member, HttpSession session) {
		member = (Member)session.getAttribute("member");
		return "Meeting/meetingMain";
	}
	
	@RequestMapping(value = "Meeting/meetingList", method = RequestMethod.GET)
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int pageNo, 
			Model model, Member member,
			HttpSession session) {
		member = (Member)session.getAttribute("member");
		session.setAttribute("pageNo", pageNo);
		
		int rowsPerPage = 10;
		int pagesPerGroup = 5;
				
		//전체 게시물 수
		int totalMeetingNo = meetingService.getTotalMeetingNo();
		
		//전체 페이지 수
		int totalPageNo = totalMeetingNo/rowsPerPage;
		if(totalMeetingNo%rowsPerPage != 0) { totalPageNo++; }
		
		//전체 그룹 수
		int totalGroupNo = totalPageNo / pagesPerGroup;
		if(totalPageNo%pagesPerGroup != 0) { totalGroupNo++; }
		
		//현재 그룹번호, 시작페이지번호, 끝페이지번호
		int groupNo = (pageNo-1)/pagesPerGroup + 1;
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo==totalGroupNo) { endPageNo = totalPageNo; }
		
		//현재 페이지 게시물 리스트
		List<Meeting> list = meetingService.getPage(pageNo, rowsPerPage, member);
		
		//View로 넘길 데이터
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("list", list);
		model.addAttribute("nick", member.getNick());
		return "Meeting/meetingList";
	}
	
	@RequestMapping(value = "Meeting/meetingList", method = RequestMethod.POST)
	public String searchMeetingList(HttpSession session, Search search){
		meetingService.getPage(10, 5, (Member)session.getAttribute("member"), search);
		return "Meeting/meetingList";
	}
	
	@RequestMapping("Meeting/write")
	public String write(HttpSession session, Meeting meeting){
		Member member = (Member)session.getAttribute("member");
		meeting.setMemberId(member.getId());
		meetingService.add(meeting);
		return "Meeting/meetingList";
	}
	
}


