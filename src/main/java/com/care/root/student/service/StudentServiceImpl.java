package com.care.root.student.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.student.dao.StudentDAO;
import com.care.root.student.dto.StudentInfoDTO;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired StudentDAO mapper;
	@Override
	public void studentInfo(Model model, String id) {
		StudentInfoDTO dto = mapper.studentInfo(id);
		String birthDate = dto.getResidentNum().substring(0, 6);
		dto.setBirthDate(birthDate);
		try {
			model.addAttribute("info", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
