package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.MatjibCommentDao;
import com.mycompany.myapp.dto.Matjib;
import com.mycompany.myapp.dto.MatjibComment;
import com.mycompany.myapp.dto.Member;

@Component
public class MatjibCommentService {

	@Autowired
	private MatjibCommentDao matjibCommentDao;

	public void add(MatjibComment matjibComment, Matjib matjib, Member member) {
		matjibCommentDao.insert(matjibComment, matjib, member);
	}
	
	public List<MatjibComment> getPage(int pageNo, int rowsPerPage) {
		List <MatjibComment> list = matjibCommentDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	
	public void modify (MatjibComment matjibComment) {
		matjibCommentDao.update(matjibComment);
	}
	
	public void remove (int matjibCommentNo) {
		matjibCommentDao.delete(matjibCommentNo);
	}
	
	public int getTotalMatjibCommentNo() {
		int rows = matjibCommentDao.selectCount();
		return rows;
	}
}
