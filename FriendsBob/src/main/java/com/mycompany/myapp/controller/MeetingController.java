package com.mycompany.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MeetingController {

	
	@RequestMapping("Meeting/meetingMain")
	public String meetingMain() {
		return "Meeting/meetingMain";
	}
	
	@RequestMapping(value = "Meeting/main", method = RequestMethod.GET)
	public String meetingList() {
		return "Meeting/meetingList";
	}
	
	@RequestMapping(value = "Meeting/meetingList", method = RequestMethod.POST)
	public String searchMeetingList() {
		return "Meeting/meetingList";
	}
}


