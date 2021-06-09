package com.care.root.student.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface StudentService {
	public void studentInfo(Model model, String id);
	public void subjectInfo(Model model, String id);
	public String tuitionPayment(String id, HttpServletRequest request);
	public void tuitionInfo(Model model, String id);
	public void classRequest(Model model, String id);
	public void classReqChk(String id);
}
