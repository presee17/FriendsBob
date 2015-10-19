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
	
	@RequestMapping(value="/Partner/write",method=RequestMethod.GET)
	public String writeForm(){
		return "Partner/partnerWriteForm";
	}
	
	@RequestMapping(value="/Partner/write",method=RequestMethod.POST)
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
		return "redirect:/Partner/partnerList?kind=all";
	}
	
	@RequestMapping("/Partner/partnerList")
	public String list(
			String kind,
			@RequestParam(value="pageNo",defaultValue="0") int pageNo, 
			Model model, 
			HttpSession session){
	    if(pageNo == 0) {
	    	session.setAttribute("kind", kind);
	    	pageNo=1;
	    } else {
	    	kind = (String) session.getAttribute("kind");
	    }
	   
		String kinds = null;
		
		if(kind.equals("k")) {
			kinds="한식";
		}else if(kind.equals("w")){
			kinds="양식";
		}else if(kind.equals("j")){
			kinds="일식";
		}else if(kind.equals("c")){
			kinds="중식";
		}else if(kind.equals("b")){
			kinds="분식";
		}else if(kind.equals("all")){
			kinds="all";
		}
		
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
		
		List<Partner> list = partnerService.getPage(pageNo,rowsPerPage,kinds);
		
		model.addAttribute("pagesPerGroup",pagesPerGroup);
		model.addAttribute("totalPageNo",totalPageNo);
		model.addAttribute("totalGroupNo",totalGroupNo);
		model.addAttribute("groupNo",groupNo);
		model.addAttribute("startPageNo",startPageNo);
		model.addAttribute("endPageNo",endPageNo);
		model.addAttribute("pageNo",pageNo);
		model.addAttribute("kind",kind);

		model.addAttribute("list",list);
		model.addAttribute("member",session.getAttribute("member"));
		return "Partner/partnerList";	
	}
	
	@RequestMapping("/Partner/partnerMain")
	public String main(){
		return "Partner/partnerMain";
	}
	
	@RequestMapping("/Partner/partnerDetail")
	public String detail(int partnerNo, Model model){
		Partner partner=partnerService.getPartner(partnerNo);
		model.addAttribute("partner",partner);
		return "Partner/partnerDetail";
	}
	
	@RequestMapping("/Partner/partnerUpdate")
	public String partnerUpdate(@RequestParam("pno")int partnerNo, Model model){
		Partner partner=partnerService.getPartner(partnerNo);
		model.addAttribute("partner",partner);
		return "Partner/partnerUpdate";
	}
	
	@RequestMapping("/Partner/update")
	public String update(Partner partner){
		partnerService.modify(partner);
		return "redirect:/Partner/partnerDetail?partnerNo="+partner.getNo();
	}
	
	@RequestMapping("/Partner/partnerDelete/{partnerNo}")
	public String delete(@PathVariable int partnerNo){
		partnerService.remove(partnerNo);
		return "redirect:/Partner/partnerList?kind=all";
	}
}
