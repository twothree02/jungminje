package com.care.root.officer.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.root.officer.dto.OfficerDTO;

public interface OfficerService {
	public OfficerDTO staffInfo(String id);
	public int insertStu(HttpServletRequest request);
	public ArrayList<String> findProfessor(String major);
	public ArrayList<OfficerDTO> findinfo(String major, Model model, int num);
	public ArrayList<OfficerDTO> findAll(Model model, int num);
	public ArrayList<OfficerDTO> searchAll(String searchS, String searchT);
	public ArrayList<OfficerDTO> searchStudent(String searchS, String searchT, String searchM);
	public OfficerDTO studentInfo(String idNum);
}
