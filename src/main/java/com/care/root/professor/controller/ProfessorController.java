package com.care.root.professor.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.professor.dto.ProfessorDTO;
import com.care.root.professor.service.ProfessorService;

@Controller
@RequestMapping("professor")
public class ProfessorController {
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
	public String showGrade(Model model) {
		String lecName = "정보윤리"; //나중에 로그인하는 교수가 가르치는 과목 받아와서 바꿔야함.
		ps.showGrade(model, lecName);
		return "professor/inputGrade";
	}
	@PostMapping(value = "junior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> juniorList() {
		//나중에 학과별로도 구분지어줘야 한다면 넣어줄 것.
		String position = "학생";
		String grade = "1";
		//System.out.println("확인 메시지"); //잘 넘어오나 확인용
		
//		ArrayList<ProfessorDTO> list = new ArrayList<ProfessorDTO>();
//		for(int i=0;i<3;i++) {
//		ProfessorDTO dto = new ProfessorDTO();
//		dto.setIdNum("값"+i);
//		list.add(dto);
//		}
//		return list;
		return ps.getJuniorList(position, grade);
	}
	@PostMapping(value="senior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> seniorList(){
		String position = "학생";
		String grade = "2";
		
		return ps.getSeniorList(position,grade);
	}
	@PostMapping(value="admin_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> adminList(){
		String position = "관리자"; //행정직원 포지션을 교직원으로 할지, 관리자로 할지 정할 것
		
		return ps.getAdminList(position);
	}
	@PostMapping(value="bProfessor_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> bProfessorList(){
		String position = "정교수"; //행정직원 포지션을 교직원으로 할지, 관리자로 할지 정할 것
		String major = "경영학과";
		
		return ps.getBProfessorList(position, major);
	}
 
@PostMapping(value="iProfessor_list", produces = "application/json; charset=utf-8")
@ResponseBody
public ArrayList<ProfessorDTO> iProfessorList(){
	String position = "정교수"; //행정직원 포지션을 교직원으로 할지, 관리자로 할지 정할 것
	String major = "정보통신과";
	
	return ps.getIProfessorList(position, major);
}
@PostMapping(value="cProfessor_list", produces = "application/json; charset=utf-8")
@ResponseBody
public ArrayList<ProfessorDTO> cProfessorList(){
	String position = "정교수"; //행정직원 포지션을 교직원으로 할지, 관리자로 할지 정할 것
	String major = "자동차공학과";
	
	return ps.getCProfessorList(position, major);
}



}