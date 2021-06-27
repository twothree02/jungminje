package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {
	public int loginChk(HttpServletRequest request);
	public String findId(String name, String tel);
}
