package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.noticedto.noticeMessageDTO;

public interface BoardFileService {
	public static final String IMAGE_REPO = "C:\\Users\\kyc22\\Desktop\\final";
	public String getMessage(int num, HttpServletRequest request);
	public String saveFile(MultipartFile file);
	public void deletefile(String originFileName);
	public String getMessage(noticeMessageDTO mDTO);
}
