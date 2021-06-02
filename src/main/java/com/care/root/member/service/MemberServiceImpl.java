package com.care.root.member.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.member.dao.MemberDAO;
import com.care.root.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDAO mapper;
	
	@Override
	public int loginChk(HttpServletRequest request) {
		MemberDTO dto = mapper.loginChk(request.getParameter("inputId"));
		if(dto != null) {
			// 암호화 되기 전 코드, 암호화 완료 시 수정 필요!
			if(request.getParameter("inputPwd").equals(dto.getPw())) {
				return 0;
			}
		}
		return 1;
	}

	@Override
	public String findId(String name, String tel) {
		// 암호화 되기 전 코드, 암호화 완료 시 수정 필요!
		System.out.println("서비스");
		System.out.println(name);
		System.out.println(tel);		
		return mapper.findId(name, tel);
	}
	
}
