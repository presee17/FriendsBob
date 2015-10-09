package com.mycompany.myapp.dto;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class PartnerImg {
	private int partnerNo;
	private String img;
	private String originalFileName;
	private String filesytemName;
	private String contentType;
	private MultipartFile attach;
	
	public int getPartnerNo() {
		return partnerNo;
	}
	public void setPartnerNo(int partnerNo) {
		this.partnerNo = partnerNo;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getFilesytemName() {
		return filesytemName;
	}
	public void setFilesytemName(String filesytemName) {
		this.filesytemName = filesytemName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	
}
