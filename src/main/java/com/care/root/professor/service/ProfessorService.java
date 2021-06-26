package com.care.root.professor.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorService {
	public Map<String, Object> getJuniorList(String major, int num);
	public Map<String, Object> getSeniorList(String major, int num);
	public Map<String, Object> getSearchStu(String searchSel, String searchInp, int num);
	public ArrayList<ProfessorDTO> getSearchStaff(String searchName, String position);
	public Map<String, Object> getAdminList(String position, int num);
	public Map<String, Object> getBProfessorList(int num);
	public Map<String, Object> getIProfessorList(int num);
	public Map<String, Object> getCProfessorList(int num);
	public void showTimeTable(Model model, String pId);
	public String lecCheck(String pId);
	public String majorCheck(String pId);
	public void showGrade(Model model, String lecName, String tYear);
	public String inputGrade(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void detailStuInfo(Model model, String id);
	public ArrayList<GradeInfoDTO> getSemeDetail(String idNum, String gSeme);
	public void semeGrade(Model model, String id);
	
}
