package com.care.hair.review.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ReviewFileServiceImpl implements ReviewFileService {

	public String getMessage(String msg, String url) {
		String message = ""; 
		message += "<script> alert('" + msg + "'); ";
		message += "location.href='" + url + "'; </script>";
		
		return message; 
	}
	
	public String saveFile(MultipartFile file) {
	    SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
	    Calendar calendar = Calendar.getInstance(); // 현재 날짜
	    String sysFileName = 
	    		simpl.format(calendar.getTime()) + file.getOriginalFilename();
	    File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
	    System.out.println("sysFileName : "+sysFileName);
	    try {
	    	file.transferTo(saveFile);//해당 위치에 파일 저장
	    }catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return sysFileName;
	}

	public void deleteImage(String fName) {
		File dFile = new File(IMAGE_REPO+"/"+fName);
		dFile.delete(); 
	}
	
}
