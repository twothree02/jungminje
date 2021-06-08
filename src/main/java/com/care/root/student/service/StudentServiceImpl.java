package com.care.root.student.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.student.dao.StudentDAO;
import com.care.root.student.dto.StudentInfoDTO;
import com.care.root.student.dto.SubjectDTO;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired StudentDAO mapper;
	@Override
	public void studentInfo(Model model, String id) {

		try {
			StudentInfoDTO dto = mapper.studentInfo(id);
			String birthDate = dto.getResidentNum().substring(0, 6);
			dto.setBirthDate(birthDate);
			model.addAttribute("info", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}

	}
	@Override
	public void subjectInfo(Model model, String id) {

		try {
			StudentInfoDTO dto = mapper.studentInfo(id);
			ArrayList<SubjectDTO> list = mapper.subjectInfo(dto.getGradeSemester(), dto.getMajor());
			model.addAttribute("info", dto);
			model.addAttribute("subject", list);
			model.addAttribute("repeat", list.size());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
