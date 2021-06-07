package com.care.root.professor.dao;

import java.util.ArrayList;

import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorDAO {
	public ArrayList<ProfessorDTO> getJuniorList(String position);
}
