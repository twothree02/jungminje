package com.care.root.student.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			ss.subjectInfo(model, id);
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
		public String tuitionChk(Model model, HttpSession session) {
			String id = (String) session.getAttribute(LOGIN);
			ss.tuitionInfo(model, id);
			
			return "student/tuitionChk";
		}
		@PostMapping("tuitionPayment")
		public String tuitionPayment(HttpServletResponse response, HttpSession session,HttpServletRequest request) throws Exception {
			/*
			 * System.out.println("은행 : "+request.getParameter("bankSelet"));
			 * System.out.println("계좌 : "+request.getParameter("account"));
			 */
			String id = (String) session.getAttribute(LOGIN);
			String message = ss.tuitionPayment(id, request);
			
			//PrintWriter out = response.getWriter();
			//response.setContentType("text/html; charset=utf-8");
			//out.print(message);

			return "redirect:tuitionChk";
		}
}
