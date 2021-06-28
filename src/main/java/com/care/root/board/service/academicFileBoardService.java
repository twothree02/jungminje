package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.academicdto.academicMessageDTO;
import com.care.root.board.portaldto.portalMessageDTO;

public interface academicFileBoardService {
	public static final String IMAGE_REPO = "C:\\Users\\kyc22\\Desktop\\final";
	public String academicMessage(int num, HttpServletRequest request);
	public String academicSaveFile(MultipartFile file);
	public void academicDeletefile(String originFileName);
	public String academicGetMessage(academicMessageDTO mDTO);
}
