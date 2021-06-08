package com.care.root.professor.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.professor.dao.ProfessorDAO;
import com.care.root.professor.dto.ProfessorDTO;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired ProfessorDAO pm;
	@Override
	public ArrayList<ProfessorDTO> getJuniorList(String position, String grade) {
		return pm.getJuniorList(position, grade);
	}
	public ArrayList<ProfessorDTO> getSeniorList(String position, String grade) {
		return pm.getSeniorList(position, grade);
	}
	@Override
	public void inputGrade(Model model, String lecName) {
		model.addAttribute("gradeInfo", pm.getGradeInfo(lecName)); //성적입력에 넣을 값
		
	}
	
}
