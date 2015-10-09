package com.mycompany.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mycompany.myapp.dao.PartnerDao;
import com.mycompany.myapp.dto.Partner;

@Component
public class PartnerService {
	@Autowired
	private PartnerDao partnerDao;
	
	public void add(Partner partner){
		partnerDao.insert(partner);
	}
	
	public List<Partner> getPage(int pageNo, int rowsPerPage, String kinds){
		List<Partner> list=partnerDao.selectByPage(pageNo, rowsPerPage,kinds);
		return list;
	}
	
	public Partner getPartner(int partnerNo){
		Partner partner=partnerDao.selectByPk(partnerNo);
		return partner;
	}
	
	public void modify(Partner partner){
		partnerDao.update(partner);
	}
	
	public void remove(int partnerNo){
		partnerDao.delete(partnerNo);
	}
	
	public int getTotalPartnerNo(){
		int rows=partnerDao.selectCount();
		return rows;
	}
}
