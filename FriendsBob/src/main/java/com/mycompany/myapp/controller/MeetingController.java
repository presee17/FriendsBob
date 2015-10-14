package com.mycompany.myapp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Search;
import com.mycompany.myapp.service.MeetingService;

@Controller
public class MeetingController {

	@Autowired MeetingService meetingService;
	
	@RequestMapping("Meeting/meetingMain")
	public String meetingMain(Member member, HttpSession session) {
		member = (Member)session.getValue("member");
		return "Meeting/meetingMain";
	}
	
	@RequestMapping(value = "Meeting/meetingList", method = RequestMethod.GET)
	public String MeetingList(HttpSession session) {
		Member member = (Member)session.getValue("member");
		System.out.println("test"+member.getAddress1());
		meetingService.getPage(10, 5, (Member)session.getValue("member"));
		return "Meeting/meetingList";
	}
	
	@RequestMapping(value = "Meeting/meetingList", method = RequestMethod.POST)
	public String searchMeetingList(HttpSession session, Search search) {
		meetingService.getPage(10, 5, (Member)session.getValue("member"), search);
		return "Meeting/meetingList";
	}
}


