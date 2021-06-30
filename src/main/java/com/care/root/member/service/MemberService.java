package com.care.root.member.service;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.member.dto.MemberDTO;

public interface MemberService {
	public int loginChk(HttpServletRequest request);
	public String findId(String name, String phone);
	public String findPw(String id, String email, HttpServletRequest request, HttpServletResponse response);
	public void logout(HttpSession session, HttpServletResponse response);
	public ArrayList<MemberDTO> getInfo(String id);
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void rememberId(String sessionId, Date limitDate, String id);
	public int getSessionId(String id);
	public void setNull(String id);
}