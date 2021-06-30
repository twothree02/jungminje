package com.care.root.member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.root.common.session.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberFileService;
import com.care.root.member.service.MemberService;

@Controller
public class MemberController implements MemberSessionName {

	@Autowired
	MemberService ms;

	/** 로그인 */
	@RequestMapping("login")
	public String login(HttpServletRequest request, Model model) {
		model.addAttribute("id", request.getSession().getAttribute(LOGIN));
		return "member/login";
	}

	@PostMapping("loginChk")
	public String loginChk(HttpServletRequest request, HttpSession session, RedirectAttributes ra) {
		int result = ms.loginChk(request);
		if(result == 0) {
			ra.addAttribute("id", request.getParameter("inputId"));
			ra.addAttribute("rememberId", request.getParameter("rememberId"));
			session.setAttribute(LOGIN, request.getParameter("inputId"));
			return "redirect:successLogin";
		}
		return "redirect:login";
	}
	
	@RequestMapping("successLogin")
	public String successLogin(@RequestParam("id") String id, @RequestParam(value="rememberId", required=false) String rememberId, HttpSession session, HttpServletResponse response) {
		//session.setAttribute(LOGIN, id);	//여러 사용자의 세션을 관리하기 위함
		if(rememberId != null) {
			int limitTime = 60 * 60 * 24 * 90;	//90일 동안 세션 유지
			Cookie loginCookie = new Cookie("loginCookie", session.getId());
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date());
			//DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			//System.out.println("시간 설정 : "+df.format(cal.getTime()));
			
			cal.add(Calendar.MONTH, 3);
			//System.out.println("2달 시간 설정 : "+df.format(cal.getTime()));
			
			//long expiredDate = System.currentTimeMillis()+(limitTime * 1000);
			Date limitDate = new Date(cal.getTimeInMillis());
			//System.out.println("sql date : "+limitDate);
			ms.rememberId(session.getId(), limitDate, id);
		}
		else {
			ms.setNull(id);
		}
		return "redirect:main";
	}

	/** 아이디, 비밀번호 찾기 */
	@GetMapping("findAccount")
	public String findAccount() {
		return "member/findAccount";
	}

	@PostMapping(value="findId", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findId(@RequestBody Map<String,Object> map) {
		String id = ms.findId((String)map.get("inputName"), (String)map.get("inputPhone"));
		return "{\"result\":\"" + id + "\"}";
	}
	
	@PostMapping(value="findPw", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String findPw(@RequestBody Map <String,Object> map, HttpServletRequest request,  HttpServletResponse response) {
		String tempPw = ms.findPw((String)map.get("inputId"), (String)map.get("inputEmail"), request, response);
		return "{\"result\":\"" + tempPw + "\"}";
	}
	
	/** 정보수정 */
	@GetMapping("modifyInfo")
	public String modifyInfo(HttpSession session, Model model) {
		ArrayList<MemberDTO> memberList = ms.getInfo((String) session.getAttribute(LOGIN));
		//MemberDTO dto = ms.getIn(LOGIN);
		model.addAttribute("memberList", memberList);
		return "member/modifyInfo";
	}

	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul, HttpServletResponse response, HttpServletRequest request) throws IOException {
		String message = ms.modify(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	
	@GetMapping("member/download")
	public void download(@RequestParam String imageFile, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment;imageFile=" + imageFile);	//Content-disposition : 해당하는 내용을 in-line으로 붙일 건지, 다운로드 할 건지 결정
		File file = new File(MemberFileService.IMAGE_REPO + "/" + imageFile);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());	//in에서 얻어온 값을 outStream으로 사용자에게 내보냄
		in.close();
	}
	
	@GetMapping("main")
	public String main(HttpSession session, Model model) {
		ArrayList<MemberDTO> memberList = ms.getInfo((String) session.getAttribute(LOGIN));
		model.addAttribute("memberList", memberList);
		return "main";
	}
	
	/** 로그아웃 */
	/*
	@GetMapping("logout")
	public String logout(HttpSession session, HttpServletResponse response) {
		ms.logout(session, response);
		session.invalidate();
		return "redirect:login";
	}
	*/
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		int result = ms.getSessionId((String)session.getAttribute(LOGIN));
		if(result == 1) {
			return "redirect:login";
		}
		else {
			session.invalidate();
			return "redirect:/";
		}
	}
}