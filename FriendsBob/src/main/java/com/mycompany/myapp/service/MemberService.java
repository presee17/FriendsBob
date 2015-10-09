package com.mycompany.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.MemberDao;
import com.mycompany.myapp.dto.Login;
import com.mycompany.myapp.dto.Member;

@Component
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public void Memberlist() {// 운영자가 볼 수 있는 멤버의 리스트

	}

	public boolean joinCheck(Member member) {// 회원 가입
		boolean joinOk;
		if (memberDao.selectById(member.getId()) == null) {
			joinOk = true;// 가입 가능
		} else {
			joinOk = false;// 해당 아이디 존재
		}
		return joinOk;
	}

	public void join(Member member) {// 회원 가입
		memberDao.insert(member);
	}

	public void dropOut(String id) {// 회원 탈퇴. 사용자 임의로 탈퇴하는 경우, 2번 이상 경고 받은 사용자에
									// 대해 운영자가 강제 탈퇴 처리
		memberDao.delete(id);
	}

	public String login(Login login) {// 회원 로그인
		String state = "";
		if (memberDao.selectById(login.getId()) == null) {
			state = "noId";
		} else {
			if (memberDao.selectById(login.getId()).getPassword().equals(login.getPassword())) {
				state = "correct";
			} else {
				state = "wrongPw";
			}
		}
		return state;
	}

	public void givePoint(String id, int point) {// 포인트 주기
		Member member = memberDao.selectById(id);
		int afterPoint = member.getPoint() + point;
		member.setPoint(afterPoint);
	}
	

	
	public Member findPw(String id){
		if(memberDao.selectById(id) == null){
			return null;//이름에 해당되는 아이디가 없는 경우
		}else{
			return memberDao.selectById(id); //이름에 해당되는 아이디 찾은 경우
		}
	}
}