package com.care.root.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService ms;
	
	/** 로그인 */
	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@PostMapping("loginChk")
	public String loginChk(HttpServletRequest request, RedirectAttributes rs) {
		int result = ms.loginChk(request);
		if(result == 0) {
			rs.addAttribute("id", request.getParameter("inputId"));
			System.out.println("로그인 성공");
			return "home";
		}
		System.out.println("로그인 실패");
		return "redirect:login";
	}
	
	/** 아이디, 비밀번호 찾기 */
	@GetMapping("findAccount")
	public String findAccount() {
		return "member/findAccount";
	}
	
	@PostMapping(value="findId", produces = "application/json; charset=utf-8")
	public String findId(@PathVariable String inputName, @PathVariable String inputTel, Model model) {
		String id = ms.findId(inputName, inputTel);
//		model.addAttribute("id", id);
//		model.addAttribute("name", request.getParameter("inputName"));
		return "{\"result\":\"success\"}";
	}
}
