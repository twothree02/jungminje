package com.care.root.professor.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.root.professor.dao.ProfessorDAO;
import com.care.root.professor.dto.ProfessorDTO;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired ProfessorDAO pm;
	@Override
	public ArrayList<ProfessorDTO> getJuniorList(String position, String grade) {
		return pm.getJuniorList(position, grade);
	}
	
}
