package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface MemberService {
	public int loginChk(HttpServletRequest request);
	public String findId(String name, String phone);
	public String findPw(String id, String email, HttpServletRequest request, HttpServletResponse response);
	public void logout(HttpSession session, HttpServletResponse response);
}
