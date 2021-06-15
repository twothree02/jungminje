package com.care.root.professor.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorService {
	public ArrayList<ProfessorDTO> getJuniorList(ProfessorDTO dto);
	public ArrayList<ProfessorDTO> getSeniorList(ProfessorDTO dto);
	public ArrayList<ProfessorDTO> getSearchStu(String searchName, String position);
	public ArrayList<ProfessorDTO> getSearchStaff(String searchName, String position);
	public ArrayList<ProfessorDTO> getAdminList(String position);
	public ArrayList<ProfessorDTO> getBProfessorList(String position, String major);
	public ArrayList<ProfessorDTO> getIProfessorList(String position, String major);
	public ArrayList<ProfessorDTO> getCProfessorList(String position, String major);
	public String lecCheck(String pId);
	public String majorCheck(String pId);
	public void showGrade(Model model, String lecName);
	public String inputGrade(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void detailStuInfo(Model model, String id);
	
}
