package com.care.root.professor.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorService {
	public ArrayList<ProfessorDTO> getJuniorList(String position, String grade);
	public ArrayList<ProfessorDTO> getSeniorList(String position, String grade);
	public ArrayList<ProfessorDTO> getAdminList(String position);
	public ArrayList<ProfessorDTO> getBProfessorList(String position, String major);
	public ArrayList<ProfessorDTO> getIProfessorList(String position, String major);
	public ArrayList<ProfessorDTO> getCProfessorList(String position, String major);
	public void showGrade(Model model, String lecName);
	public String inputGrade(MultipartHttpServletRequest mul, HttpServletRequest request);
}
