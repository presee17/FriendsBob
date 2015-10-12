package com.mycompany.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MeetingController {

	
	@RequestMapping("Meeting/meetingMain")
	public String meetingMain() {
		return "Meeting/meetingMain";
	}
	
	@RequestMapping("Meeting/meetingList")
	public String dropOutForm() {
		return "Meeting/meetingList";
	}
}


