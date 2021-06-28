package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface MemberFileService {
	public static final String IMAGE_REPO = "C:\\Users\\User\\Desktop\\Programs\\Micro_SW\\image_repo";
	public String saveFile(MultipartFile file);
}
