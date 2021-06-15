package com.care.root.professor.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.common.session.MemberSessionName;
import com.care.root.professor.dto.ProfessorDTO;
import com.care.root.professor.service.ProfessorService;

@Controller
@RequestMapping("professor")
public class ProfessorController implements MemberSessionName{
	@Autowired ProfessorService ps;
	@GetMapping("all_student")
	public String allStudent() {
		return "professor/allStudent";
	}
	@GetMapping("staff_network")
	public String staffNewwork() {
		return "professor/staffNetwork";
	}
	@PostMapping("input_grade")
	public void inputGrade(MultipartHttpServletRequest mul,
								HttpServletResponse response,
								HttpServletRequest request) throws Exception {
		String message = ps.inputGrade(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	@GetMapping("show_grade")
	public String showGrade(Model model, HttpSession session) {
		String pId = (String)session.getAttribute(LOGIN);
		System.out.println(pId);
		//String lecName="정보윤리";\
		//resultMap이 아니라 resultType으로 해주니 반환 잘 됨.
		String lecName = ps.lecCheck(pId); //세션 아이디를 넣어서 얻어온 교수가 가르치는 과목
		System.out.println(lecName); //잘 가져오나 test
		ps.showGrade(model, lecName);
		return "professor/inputGrade";
	}
	@PostMapping(value = "junior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> juniorList(HttpSession session) {
		ProfessorDTO dto = new ProfessorDTO();
		//세션으로(idNum으로) 전공 끌고와 본인 과 학생들만 보이게 해줬음.
		String pId = (String)session.getAttribute(LOGIN);
		dto.setMajor(ps.majorCheck(pId));
		dto.setGrade(1);
		dto.setPosition("학생");
		
		return ps.getJuniorList(dto);
	}
	//responsebody는 json을 리턴할 때 많이 사용
	@PostMapping(value="senior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> seniorList(HttpSession session){
		ProfessorDTO dto = new ProfessorDTO();
		//세션으로(idNum으로) 전공 끌고와 본인 과 학생들만 보이게 해줬음.
		String pId = (String)session.getAttribute(LOGIN);
		dto.setMajor(ps.majorCheck(pId));
		dto.setGrade(2);
		dto.setPosition("학생");
		
		return ps.getSeniorList(dto);
	}
	@PostMapping(value="search_stu", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> searchStu(@RequestBody Map<String,Object> map){
		String searchName = (String)map.get("sName");
		String position = "학생";
		System.out.println(searchName);
		return ps.getSearchStu(searchName, position);
	}
	@PostMapping(value="search_staff", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> searchStaff(@RequestBody Map<String,Object> map){
		String searchName = (String)map.get("staName");
		String position = "학생"; //제외시킬 것
		System.out.println(searchName);
		return ps.getSearchStaff(searchName, position);
	}
	@PostMapping(value="admin_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> adminList(){
		String position = "교직원"; 
		
		return ps.getAdminList(position);
	}
	@PostMapping(value="bProfessor_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> bProfessorList(){
		String position = "교수"; //행정직원 포지션을 교직원으로 할지, 관리자로 할지 정할 것
		String major = "경영학과";
		
		return ps.getBProfessorList(position, major);
	}
 
@PostMapping(value="iProfessor_list", produces = "application/json; charset=utf-8")
@ResponseBody
public ArrayList<ProfessorDTO> iProfessorList(){
	String position = "교수"; 
	String major = "정보통신과";
	
	return ps.getIProfessorList(position, major);
}
@PostMapping(value="cProfessor_list", produces = "application/json; charset=utf-8")
@ResponseBody
public ArrayList<ProfessorDTO> cProfessorList(){
	String position = "교수"; 
	String major = "자동차공학과";
	
	return ps.getCProfessorList(position, major);
}



}