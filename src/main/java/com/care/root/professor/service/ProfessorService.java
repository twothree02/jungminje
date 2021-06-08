package com.care.root.professor.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorService {
	public ArrayList<ProfessorDTO> getJuniorList(String position, String grade);
	public ArrayList<ProfessorDTO> getSeniorList(String position, String grade);
	public void inputGrade(Model model, String lecName);
}
