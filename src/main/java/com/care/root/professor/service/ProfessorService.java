package com.care.root.professor.service;

import java.util.ArrayList;

import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorService {
	public ArrayList<ProfessorDTO> getJuniorList(String position, String grade);
}
