package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.MeetingDao;
import com.mycompany.myapp.dto.Meeting;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.dto.Search;

@Component
public class MeetingService {
	
	@Autowired
	private MeetingDao meetingDao;
	
	public void add(Meeting meeting) {
		meetingDao.insert(meeting);
	}
	
	public List<Meeting> getPage(int pageNo, int rowsPerPage, Member member, Search search) {
		List<Meeting> list = meetingDao.selectByAddressForPage(pageNo, rowsPerPage, search.getAddress1(), search.getAddress2());
		return list;
	}
	
	public List<Meeting> getPage(int pageNo, int rowsPerPage, Member member) {
		List<Meeting> list = meetingDao.selectByAddressForPage(pageNo, rowsPerPage, member.getAddress1(), member.getAddress2());
		return list;
	}
	
	public Meeting getMeeting(int meetingNo) {
		Meeting meeting = meetingDao.selectByPk(meetingNo);
		return meeting;
	}
	
	public void modify(Meeting meeting) {
		meetingDao.update(meeting);
	}
	
	public void remove(int meetingNo) {
		meetingDao.delete(meetingNo);
	}
	
	public int getTotalMeetingNo() {
		int rows = meetingDao.selectCount();
		return rows;
	}
}