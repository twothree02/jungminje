package com.care.root.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student")
public class StudentController {

		@RequestMapping("totalInquiry")
		public String totalInquiry() {
			
			return "student/totalInquiry";
		}
		
		@RequestMapping("totalInquiry_C")
		public String totalInquiry_C() {
			
			return "student/totalInquiry_C";
		}
		
		@RequestMapping("totalInquiry_G")
		public String totalInquiry_G() {
			
			return "student/totalInquiry_G";
		}
		
		@RequestMapping("totalInquiry_T")
		public String totalInquiry_T() {
			
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
