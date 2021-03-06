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
import org.springframework.web.bind.annotation.ExceptionHandler;
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
import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.ProfessorDTO;
import com.care.root.professor.service.ProfessorService;

@Controller
@RequestMapping("professor")
public class ProfessorController implements MemberSessionName {
	@Autowired ProfessorService ps;
	@GetMapping("all_student")
	public String allStudent() {
		return "professor/allStudent";
	}
	@GetMapping("staff_network")
	public String staffNewwork() {
		return "professor/staffNetwork";
	}
	@GetMapping("show_myInfo")
	public String showMyInfo(Model model, HttpSession session) {
		String id = (String)session.getAttribute(LOGIN);
		ps.showMyInfo(model, id);
		
		return "professor/showMyInfo";
	}
	@PostMapping("detail_stuInfo")
	public String detailStuInfo(HttpServletRequest request, Model model){
		String id = request.getParameter("id");
		System.out.println(id);
		ps.detailStuInfo(model, id);
		ps.semeGrade(model,id);
		ps.accumulatedGrade(model,id); //?????? ?????? accumulated : ?????????
		
		return "professor/detailStuInfo";
	}
	@PostMapping(value="seme_detail", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<GradeInfoDTO> semeDetail(
			@RequestBody Map<String,Object> map){
		
		String idNum = (String)map.get("idNum");
		String gSeme = (String)map.get("seme01");
		System.out.println(idNum+","+gSeme);
		
		return ps.getSemeDetail(idNum, gSeme);
	}
	@PostMapping("input_grade")
	public void inputGrade(		HttpSession session,
								MultipartHttpServletRequest mul,
								HttpServletResponse response,
								HttpServletRequest request) throws Exception {
		String pId = (String)session.getAttribute(LOGIN);
		String message = ps.inputGrade(mul, request, pId);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	@GetMapping("show_grade")
	public String showGrade(Model model, HttpSession session) {
		String pId = (String)session.getAttribute(LOGIN);
		if(ps.chkPeriod(pId).equals("Y")) {
		System.out.println(pId);
		//resultMap??? ????????? resultType?????? ????????? ?????? ??? ???.
		String lecName = ps.lecCheck(pId); //?????? ???????????? ????????? ????????? ????????? ???????????? ??????
		
		//????????? ???????????????
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String tYear = Integer.toString(year); //????????? ??????
		
		ps.showGrade(model, lecName, tYear);
		return "professor/inputGrade";
		}else {
			return "professor/notInputPeriod";
		}
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
		//ajax??? model?????? ?????? ??? ??????.
		//????????????(idNum??????) ?????? ????????? ?????? ??? ???????????? ????????? ?????????.
		String pId = (String)session.getAttribute(LOGIN);
		String major = ps.majorCheck(pId);

		return ps.getJuniorList(major, num);
	}
	//responsebody??? json??? ????????? ??? ?????? ??????
	@PostMapping(value="senior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> seniorList(HttpSession session,
											@RequestParam(value="num", defaultValue="1", required=false)int num) 
					throws Exception{
		//ajax??? model?????? ?????? ??? ??????.
		//????????????(idNum??????) ?????? ????????? ?????? ??? ???????????? ????????? ?????????.
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
		String position = "??????"; //???????????? ???
		System.out.println(searchName);
		return ps.getSearchStaff(searchName, position);
	}
	@PostMapping(value="admin_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> adminList(@RequestParam(value="num", defaultValue="1", required=false)int num){
		String position = "?????????"; 
		
		return ps.getAdminList(position, num);
	}
	@PostMapping(value="bProfessor_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> bProfessorList(@RequestParam(value="num", defaultValue="1", required=false)int num){
//		String position = "??????"; 
//		String major = "????????????";
		
		return ps.getBProfessorList(num);
	}
 
	@PostMapping(value="iProfessor_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> iProfessorList(@RequestParam(value="num", defaultValue="1", required=false)int num){
		//	String position = "??????"; 
		//	String major = "???????????????";

		return ps.getIProfessorList(num);
	}
	@PostMapping(value="cProfessor_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> cProfessorList(@RequestParam(value="num", defaultValue="1", required=false)int num){
		//	String position = "??????"; 
		//	String major = "??????????????????";

		return ps.getCProfessorList(num);
	}
}