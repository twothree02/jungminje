package com.care.root.professor.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	@PostMapping("detail_stuInfo")
	public String detailStuInfo(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		System.out.println(id);
		ps.detailStuInfo(model, id);
		ps.semeGrade(model,id);
		
		return "professor/detailStuInfo";
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
		//resultMap이 아니라 resultType으로 해주니 반환 잘 됨.
		String lecName = ps.lecCheck(pId); //세션 아이디를 넣어서 얻어온 교수가 가르치는 과목
		
		//연도를 얻어오겠다
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String tYear = Integer.toString(year); //올해의 연도
		System.out.println(tYear);
		System.out.println(lecName); //잘 가져오나 test
		
		ps.showGrade(model, lecName, tYear);
		return "professor/inputGrade";
	}
	@GetMapping("time_table")
	public String timeTable(Model model, HttpSession session) {
		String pId = (String)session.getAttribute(LOGIN);
		ps.showTimeTable(model, pId);
		
		return "professor/timeTable";
	}
	@PostMapping(value = "junior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> juniorList(HttpSession session,
											@RequestParam(value="num", defaultValue="1", required=false)int num) 
											throws Exception{
		//ajax는 model값을 받을 수 없다.
		//세션으로(idNum으로) 전공 끌고와 본인 과 학생들만 보이게 해줬음.
		String pId = (String)session.getAttribute(LOGIN);
		String major = ps.majorCheck(pId);

		return ps.getJuniorList(major, num);
	}
	//responsebody는 json을 리턴할 때 많이 사용
	@PostMapping(value="senior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> seniorList(HttpSession session,
											@RequestParam(value="num", defaultValue="1", required=false)int num) 
					throws Exception{
		//ajax는 model값을 받을 수 없다.
		//세션으로(idNum으로) 전공 끌고와 본인 과 학생들만 보이게 해줬음.
		String pId = (String)session.getAttribute(LOGIN);
		String major = ps.majorCheck(pId);
		
		return ps.getSeniorList(major, num);
	}
	@PostMapping(value="search_stu", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> searchStu(@RequestBody Map<String,Object> map,
											@RequestParam(value="num", defaultValue="1", required=false)int num){
		String searchSel = (String)map.get("searchSelect");
		String searchInp = (String)map.get("searchInput");
		return ps.getSearchStu(searchSel, searchInp, num);
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
	public Map<String, Object> adminList(@RequestParam(value="num", defaultValue="1", required=false)int num){
		String position = "교직원"; 
		
		return ps.getAdminList(position, num);
	}
	@PostMapping(value="bProfessor_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> bProfessorList(@RequestParam(value="num", defaultValue="1", required=false)int num){
//		String position = "교수"; 
//		String major = "경영학과";
		
		return ps.getBProfessorList(num);
	}
 
@PostMapping(value="iProfessor_list", produces = "application/json; charset=utf-8")
@ResponseBody
public Map<String, Object> iProfessorList(@RequestParam(value="num", defaultValue="1", required=false)int num){
//	String position = "교수"; 
//	String major = "정보통신과";
	
	return ps.getIProfessorList(num);
}
@PostMapping(value="cProfessor_list", produces = "application/json; charset=utf-8")
@ResponseBody
public Map<String, Object> cProfessorList(@RequestParam(value="num", defaultValue="1", required=false)int num){
//	String position = "교수"; 
//	String major = "자동차공학과";
	
	return ps.getCProfessorList(num);
}



}