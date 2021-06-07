package com.care.root.professor.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@PostMapping(value = "junior_list", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ArrayList<ProfessorDTO> juniorList() {
		//나중에 학과별로도 구분지어줘야 한다면 넣어줄 것.
		String position = "학생";
		String grade = "1";
		//System.out.println("확인 메시지"); //안 넘어오고 있다.
		
//		ArrayList<ProfessorDTO> list = new ArrayList<ProfessorDTO>();
//		for(int i=0;i<3;i++) {
//		ProfessorDTO dto = new ProfessorDTO();
//		dto.setIdNum("값"+i);
//		list.add(dto);
//		}
//		return list;
		return ps.getJuniorList(position, grade);
	}
}
