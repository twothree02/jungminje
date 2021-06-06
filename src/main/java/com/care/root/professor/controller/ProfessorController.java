package com.care.root.professor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.professor.service.ProfessorService;

@Controller
@RequestMapping("professor")
public class ProfessorController {
	@Autowired ProfessorService ps;
	@GetMapping("student_info")
	public String studentInfo() {
		return "professor/studentInfo";
	}
}
