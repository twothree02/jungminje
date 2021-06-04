package com.care.root.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.common.session.MemberSessionName;
import com.care.root.member.service.MemberService;

@Controller
public class MemberController implements MemberSessionName {

	@Autowired
	MemberService ms;

	/** 로그인 */
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}

	@PostMapping("loginChk")
	public String loginChk(HttpServletRequest request, HttpSession session) {
		int result = ms.loginChk(request);
		if(result == 0) {
			session.setAttribute(LOGIN, request.getParameter("inputId"));
			System.out.println("로그인 성공");
			return "redirect:main";
		}
		System.out.println("로그인 실패");
		return "redirect:login";
	}
	
	@GetMapping("main")
	public String main() {
		return "main";
	}

	/** 아이디, 비밀번호 찾기 */
	@GetMapping("findAccount")
	public String findAccount() {
		return "member/findAccount";
	}

	@PostMapping(value="findId", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findId(@RequestBody Map <String,Object> map) {
		String id = ms.findId((String)map.get("inputName"), (String)map.get("inputPhone"));
		return "{\"result\":\"" + id + "\"}";
	}
	
	@PostMapping(value="findPw", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findPw(@RequestBody Map <String,Object> map, HttpServletRequest request,  HttpServletResponse response) {
		String tempPw = ms.findPw((String)map.get("inputId"), (String)map.get("inputEmail"), request, response);
		return "{\"result\":\"" + tempPw + "\"}";
	}
	
	/** 정보 수정 */
	@GetMapping("modifyInfo")
	public String modifyInfo() {
		return "member/modifyInfo";
	}
	
	/** 로그아웃 */
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		ms.logout(session, response);
		session.invalidate();
		return "redirect:login";
	}
}