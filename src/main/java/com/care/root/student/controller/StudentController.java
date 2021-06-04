package com.care.root.student.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.root.common.session.MemberSessionName;
import com.care.root.student.service.StudentService;

@Controller
@RequestMapping("student")
public class StudentController implements MemberSessionName{
	
	@Autowired StudentService ss;

		@RequestMapping("totalInquiry")
		public String totalInquiry(Model model, HttpSession session) {
			String id = (String) session.getAttribute(LOGIN);
			ss.studentInfo(model, id);
			
			
			return "student/totalInquiry";
		}
		
		@RequestMapping("totalInquiry_C")
		public String totalInquiry_C(Model model, HttpSession session) {
			String id = (String) session.getAttribute(LOGIN);
			ss.studentInfo(model, id);
			return "student/totalInquiry_C";
		}
		
		@RequestMapping("totalInquiry_G")
		public String totalInquiry_G(Model model, HttpSession session) {
			String id = (String) session.getAttribute(LOGIN);
			ss.studentInfo(model, id);
			return "student/totalInquiry_G";
		}
		
		@RequestMapping("totalInquiry_T")
		public String totalInquiry_T(Model model, HttpSession session) {
			String id = (String) session.getAttribute(LOGIN);
			ss.studentInfo(model, id);
			return "student/totalInquiry_T";
		}
		
		@RequestMapping("classRequest")
		public String classRequest() {
			
			return "student/classRequest";
		}
		
		@RequestMapping("gradeInquiry")
		public String gradeInquiry() {
			
			return "student/gradeInquiry";
		}
		
		@RequestMapping("tuitionChk")
		public String tuitionChk() {
			
			return "student/tuitionChk";
		}
}
