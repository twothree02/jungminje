package com.care.root.board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.care.root.board.portaldto.portalMessageDTO;

public class portalFileBoardServiceImpl implements portalFileBoardService {

	@Override
	public String portalMessage(int num, HttpServletRequest request) {
		String message = null;
		if(num == 1) {
			message = "<script>alert('새로운 게시글이 등록 되었습니다');";
			message += "location.href='"+request.getContextPath()+
						"/portalList';</script>";
		}else {
			message = "<script>alert('문제가 발생하였습니다');";
			message += "location.href='"+request.getContextPath()+
						"/portalBoard/portalList';</script>";
		}
		return message;
	}
	@Override
	public String portalSaveFile(MultipartFile file) {
		SimpleDateFormat simpl = new SimpleDateFormat("yyyyMMddHHmmss-");
		Calendar calendar = Calendar.getInstance();
		String sysFileName = 
				simpl.format(calendar.getTime())+file.getOriginalFilename();
		File saveFile = new File(IMAGE_REPO+"/"+sysFileName);
		try {
			file.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sysFileName;
	}

	@Override
	public void portalDeletefile(String originFileName) {
		File deleteFile = new File(IMAGE_REPO+"/"+originFileName);
		deleteFile.delete();
	
	}

	@Override
	public String portalGetMessage(portalMessageDTO mDTO) {
		String message = null;
		String path = mDTO.getRequest().getContextPath();
		if(mDTO.getResult() == 1) {
			message = "<script>alert('"+mDTO.getSuccessMessage()+"');";
			message += "location.href='"+path+mDTO.getSuccessURL()+"';</script>";
		}else {
			message = "<script>alert('"+mDTO.getFailMessage()+"');";
			message += "location.href='"+path+mDTO.getFailURL()+"';</script>";
		}
		return message;
	}
	

}
