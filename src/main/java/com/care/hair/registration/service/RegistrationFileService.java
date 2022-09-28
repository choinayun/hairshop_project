package com.care.hair.registration.service;

import org.springframework.web.multipart.MultipartFile;

public interface RegistrationFileService {
	
	public String IMAGE_REPO = "c:/spring/image_repo";
	public String getMessage(String msg, String url); 
	
	public String saveFile(MultipartFile file);
	
	public void deleteImage(String fName);

}