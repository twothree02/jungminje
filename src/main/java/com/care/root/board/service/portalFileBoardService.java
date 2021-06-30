package com.care.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.portaldto.portalMessageDTO;

public interface portalFileBoardService {
	public static final String IMAGE_REPO = "C:\\Users\\kyc22\\Desktop\\final";
	public String portalMessage(int num, HttpServletRequest request);
	public String portalSaveFile(MultipartFile file);
	public void portalDeletefile(String originFileName);
	public String portalGetMessage(portalMessageDTO mDTO);
}
