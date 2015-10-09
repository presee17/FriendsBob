package com.mycompany.myapp.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.myapp.dto.Partner;
import com.mycompany.myapp.service.PartnerService;

@Controller
public class PartnerController {
	private static final Logger logger=LoggerFactory.getLogger(PartnerController.class);
	
	@Autowired
	private PartnerService partnerService;
	
	@RequestMapping(value="/board/write",method=RequestMethod.GET)
	public String writeForm(){
		return "board/writeFrom";
	}
	
	@RequestMapping(value="/board/write",method=RequestMethod.POST)
	public String write(Partner partner, HttpSession session){
		logger.info("write()");
		ServletContext application = session.getServletContext();
		String dirPath=application.getRealPath("/resources/uploadfiles");
		if(partner.getAttach()!=null){
			String originalFileName=partner.getAttach().getOriginalFilename();
			String filesystemName=System.currentTimeMillis()+"-"+originalFileName;
			String contentType=partner.getAttach().getContentType();
			if(!partner.getAttach().isEmpty()){
				try{
					partner.getAttach().transferTo(new File(dirPath+"/"+filesystemName));
				}catch(Exception e){e.printStackTrace();}
			}
			partner.setOriginalFileName(originalFileName);
			partner.setFilesystemName(filesystemName);
			partner.setContentType(contentType);
		}
		partnerService.add(partner);
		return "redirect:/partner/partnerList";
	}
	
	@RequestMapping("partner/partnerList")
	public String list(
			@RequestParam(value="pageNo",defaultValue="1")int pageNo, Model model, HttpSession session){
		logger.info("pageNo: "+pageNo);
		session.setAttribute("pageNo", pageNo);
		int rowsPerPage=10;
		int pagesPerGroup=5;
		
		int totalPartnerNo=partnerService.getTotalPartnerNo();
		
		int totalPageNo=totalPartnerNo/rowsPerPage;
		if(totalPartnerNo%rowsPerPage!=0){totalPageNo++;}
		
		int totalGroupNo=totalPageNo/pagesPerGroup;
		if(totalPageNo%pagesPerGroup!=0){totalGroupNo++;}
		
		int groupNo=(pageNo-1)/pagesPerGroup+1;
		int startPageNo=(groupNo-1)*pagesPerGroup+1;
		int endPageNo=startPageNo+pagesPerGroup-1;
		if(groupNo==totalGroupNo){endPageNo=totalPageNo;}
		
		List<Partner> list = partnerService.getPage(pageNo,rowsPerPage);
		
		model.addAttribute("pagesPerGroup",pagesPerGroup);
		model.addAttribute("totalPageNo",totalPageNo);
		model.addAttribute("totalGroupNo",totalGroupNo);
		model.addAttribute("groupNo",groupNo);
		model.addAttribute("startPageNo",startPageNo);
		model.addAttribute("endPageNo",endPageNo);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("list",list);
		
		return "partner/partnerList";	
	}
	
	@RequestMapping("/partner/partnerDetail")
	public String detail(int partnerNo, Model model){
		Partner partner=partnerService.getPartner(partnerNo);
		model.addAttribute("partner",partner);
		return "partner/partnerDetail";
	}
	
	@RequestMapping("/partner/partnerUpdate")
	public String partnerUpdate(@RequestParam("pno")int partnerNo, Model model){
		Partner partner=partnerService.getPartner(partnerNo);
		model.addAttribute("partner",partner);
		return "partner/partnerUpdate";
	}
	
	@RequestMapping("/partner/update")
	public String update(Partner partner){
		partnerService.modify(partner);
		return "redirect:/partner/partnerDetail?partnerNo="+partner.getNo();
	}
	
	@RequestMapping("/partner/delete/{partnerNo}")
	public String delete(@PathVariable int partnerNo){
		partnerService.remove(partnerNo);
		return "redirect:/partner/partnerList";
	}
}
