package com.care.root.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	
	
	
	@RequestMapping("studentMain")
	public String studentMain() {
		return "student/studentMain";
	}

	@RequestMapping("adminMain")
	public String aadminMain() {
		return "admin/adminMain";
	}

	@RequestMapping("professorMain")
	public String professorMain() {
		return "professor/professorMain";
	}
	
	
		

}
