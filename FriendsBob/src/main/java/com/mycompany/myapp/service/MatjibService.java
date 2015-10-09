package com.mycompany.myapp.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.MatjibDao;
import com.mycompany.myapp.dto.Matjib;
import com.mycompany.myapp.dto.Member;

@Component
public class MatjibService {

	@Autowired
	private MatjibDao matjibDao;
	
	public void add(Matjib matjib, Member member) {
		matjibDao.insert(matjib, member);
	}
	
	public List<Matjib> getPage(int pageNo, int rowsPerPage) {
		List<Matjib> list = matjibDao.selectByPage(pageNo, rowsPerPage);
		return list;
	}
	
	public Matjib getMatjib(int matjibNo) {
		Matjib matjib = matjibDao.selectByPk(matjibNo);
		return matjib;
	}
	
	public void modify(Matjib matjib) {
		matjibDao.update(matjib);
	}
	
	public void remove (int matjibNo) {
		matjibDao.delete(matjibNo);
	}
	
	public int getTotalMatjibNo() {
		int rows = matjibDao.selectCount();
		return rows;
	}
}
