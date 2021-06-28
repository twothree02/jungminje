package com.care.root.student.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.care.root.student.dto.GradeDTO;

public interface StudentService {
	public void studentInfo(Model model, String id);
	public void subjectInfo(Model model, String id);
	public String tuitionPayment(String id, HttpServletRequest request);
	public void totalInquiry_G(Model model, String id);
	public void totalInquiry_T(Model model, String id);
	public void tuitionInfo(Model model, String id);
	public void classRequest(Model model, String id);
	public void classReqChk(String id);
	public void gradeInquiry(Model model, String id);
	public List<GradeDTO> detailGrade(int semester, String id);
}
