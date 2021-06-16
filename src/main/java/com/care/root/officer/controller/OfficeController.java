package com.care.root.officer.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.root.common.session.MemberSessionName;
import com.care.root.officer.dto.OfficerDTO;
import com.care.root.officer.service.OfficerService;

@Controller
@RequestMapping("officer")
public class OfficeController implements MemberSessionName{

	@Autowired
	OfficerService os;
	
	@RequestMapping("staffInfo")
	public String staffInfo(HttpSession session, Model model) {
		System.out.println(session.getAttribute(LOGIN));
		model.addAttribute("dto", os.staffInfo((String)session.getAttribute(LOGIN)));
		return "admin/staffInfo";
	}
	
	@RequestMapping("studentManagement")
	public String studentManagement(Model model, @RequestParam(value = "num", required=false, defaultValue = "1") int num) {
		ArrayList<OfficerDTO> list = new ArrayList<OfficerDTO>();
		list = os.findAll(model, num);
		model.addAttribute("list", list);
		return "admin/studentManagement";
	}
	
	@RequestMapping("studentInsert")
	public String studentInsert() {
		return "admin/studentInsert";
	}
	
	@PostMapping("insertStu")
	public String insertStu(HttpServletRequest request) {
		int result = os.insertStu(request);
		if(result == 1) {
			return "admin/insertSuccess";
		}
		return "admin/insertFail";
	}
	
	@PostMapping(value="findProfessor", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<String> findProfessor(@RequestBody Map <String, Object> map) {
		return os.findProfessor((String)map.get("inputMajor"));
	}
	
	@PostMapping(value="findinfo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<OfficerDTO> findinfo(@RequestBody Map <String, Object> map, Model model, @RequestParam(value = "num", required=false, defaultValue = "1") int num){
		if(map.get("major").equals("전체")) {
			return os.findAll(model, num);
		}
		return os.findinfo((String)map.get("major"),model,num);
	}
	
	@PostMapping(value="searchStudent", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<OfficerDTO> searchStudent(@RequestBody Map <String, Object> map){
		System.out.println(map.get("searchSelect"));
		System.out.println(map.get("searchText"));
		System.out.println(map.get("searchMajor"));
		if(map.get("searchMajor").equals("all")) {
			return os.searchAll((String)map.get("searchSelect"), (String)map.get("searchText"));
		}
		return os.searchStudent((String)map.get("searchSelect"), (String)map.get("searchText"), (String)map.get("searchMajor"));
	}
	
	@RequestMapping("studentInfo")
	public String studentInfo(HttpServletRequest request, Model model) {
		OfficerDTO dto = new OfficerDTO();
		dto = os.studentInfo(request.getParameter("idNum"));
		model.addAttribute("dto", dto);
		return "admin/studentInfo";
	}
	
}
