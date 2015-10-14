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

import com.mycompany.myapp.dto.Matjib;
import com.mycompany.myapp.dto.Member;
import com.mycompany.myapp.service.MatjibService;

@Controller
public class MatjibController {
	private static final Logger logger = LoggerFactory.getLogger(MatjibController.class);

	@Autowired
	private MatjibService matjibService;

	@RequestMapping(value = "/Matjib/matjibWrite", method = RequestMethod.GET)
	public String writeForm() {
		return "Matjib/matjibForm";
	}

	
	  @RequestMapping(value="/Matjb/matjibWrite", method=RequestMethod.POST) 
	  public String write(Matjib matjib, Member member, HttpSession session) {
	  logger.info("write()");
	  
	  ServletContext application = session.getServletContext();
		String dirPath=application.getRealPath("/resources/uploadfiles");
		if(matjib.getAttach()!=null){
			String originalFileName=matjib.getAttach().getOriginalFilename();
			String filesystemName=System.currentTimeMillis()+"-"+originalFileName;
			String contentType=matjib.getAttach().getContentType();
			if(!matjib.getAttach().isEmpty()){
				try{
					matjib.getAttach().transferTo(new File(dirPath+"/"+filesystemName));
				}catch(Exception e){e.printStackTrace();}
			}
			matjib.setOriginalFileName(originalFileName);
			matjib.setFilesystemName(filesystemName);
			matjib.setContentType(contentType);
		}
	  matjibService.add(matjib, member); 
	   return "redirect:/Matjib/mtjibList"; 
	  	}
	  
	  @RequestMapping("/Matjib/matjibMain")
		public String main(){
			return "Matjib/matjibMain";
	  }
		
	@RequestMapping("/Matjib/matjibList")
	public String list(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model,
			HttpSession session) {
		logger.info("pageNo: " + pageNo);

		session.setAttribute("pageNo", pageNo);

		int rowsPerPage = 10;
		int pagesPerGroup = 5;

		// 전체 게시물 수
		int totalMatjibNo = matjibService.getTotalMatjibNo();

		// 전체 페이지 수
		int totalPageNo = totalMatjibNo / rowsPerPage;
		if (totalMatjibNo % rowsPerPage != 0) {
			totalPageNo++;
		}

		// 전체 그룹 수
		int totalGroupNo = totalPageNo / pagesPerGroup;
		if (totalPageNo % pagesPerGroup != 0) {
			totalGroupNo++;
		}

		// 현재 그룹번호, 시작페이지번호, 끝페이지번호
		int groupNo = (pageNo - 1) / pagesPerGroup + 1;
		int startPageNo = (groupNo - 1) * pagesPerGroup + 1;
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if (groupNo == totalGroupNo) {
			endPageNo = totalPageNo;
		}

		// 현재 페이지 게시물 리스트
		List<Matjib> list = matjibService.getPage(pageNo, rowsPerPage);

		// View로 넘길 데이터
		model.addAttribute("pagesPerGroup", pagesPerGroup);
		model.addAttribute("totalPageNo", totalPageNo);
		model.addAttribute("totalGroupNo", totalGroupNo);
		model.addAttribute("groupNo", groupNo);
		model.addAttribute("startPageNo", startPageNo);
		model.addAttribute("endPageNo", endPageNo);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("list", list);

		return "Matjib/matjibList";
	}

	@RequestMapping("/Matjib/matjibDetail")
	public String detail(int matjibNo, Model model) {
		matjibService.addHitcount(matjibNo);
		Matjib matjib = matjibService.getMatjib(matjibNo);
		model.addAttribute("matjib", matjib);
		return "Matjib/matjibDetail";
	}
	
	@RequestMapping("/Matjib/matjibUpdateForm") 
	public String updateForm (@RequestParam("matjibNo") int matjibNo, Model model) {
		Matjib matjib =matjibService.getMatjib(matjibNo);
		model.addAttribute("Matjib",matjib);
		return "Matjib/matjibUpdateForm";
	}
	
	@RequestMapping("/Matjib/matjibUpdate")
	public String update (Matjib matjib) {
		matjibService.modify(matjib);
		return "redirect:/Matjib/matjibDetatil?matjibNo="+matjib.getNo();
	}
	
	@RequestMapping("/Matjib/matjibDelete/{matjibNo}")
	public String delete (@PathVariable int matjibNo) {
		matjibService.remove(matjibNo);
		return "redirect:/Matjib/lsit";
	}
}