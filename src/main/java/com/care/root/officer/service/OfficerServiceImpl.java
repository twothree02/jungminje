package com.care.root.officer.service;

import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.officer.dao.OfficerDAO;
import com.care.root.officer.dto.OfficerDTO;

@Service
public class OfficerServiceImpl implements OfficerService{

	@Autowired
	OfficerDAO mapper;
	
	@Override
	public OfficerDTO staffInfo(String id) {
		OfficerDTO dto = mapper.staffInfo(id);
		dto.setBirthDate(dto.getResidentNum().substring(0,6));
		return dto;
	}

	@Override
	public int insertStu(HttpServletRequest request) {
		OfficerDTO dto = new OfficerDTO();
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		String id = year + "" + (int)(Math.random() * 9 + 1) + "" + (int)(Math.random() * 9 + 1) + "" + (int)(Math.random() * 9 + 1) + "" + (int)(Math.random() * 9 + 1);

		dto.setIdNum(id);
		dto.setPw(request.getParameter("inputResidentNum").substring(2,6));
		dto.setPosition("학생");
		dto.setName(request.getParameter("inputName"));
		dto.setResidentNum(request.getParameter("inputResidentNum"));
		dto.setCountry(request.getParameter("inputCountry"));
		dto.setGrade(Integer.parseInt(request.getParameter("inputGrade")));
		dto.setClass_(request.getParameter("inputClass"));
		dto.setPhoneNum(request.getParameter("inputPhonenum"));
		dto.setMajor(request.getParameter("inputMajor"));
		dto.setMentor(request.getParameter("inputMentor"));
		try {
			return mapper.insertStu(dto);
		}
		catch (Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public ArrayList<String> findProfessor(String major) {
		return mapper.findProfessor(major);
	}

	@Override
	public ArrayList<OfficerDTO> findinfo(String major, Model model, int num) {
		int pageLetter = 3;
		int allCount = mapper.selectMajorStudentCount(major); // 총 글 개수 얻어오기
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("list", mapper.findinfo(major, start, end));
		return mapper.findinfo(major, start, end);
	}
	
	@Override
	public ArrayList<OfficerDTO> findAll(Model model, int num) {
		int pageLetter = 3;
		int allCount = mapper.selectStudentCount(); // 총 글 개수 얻어오기
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("list", mapper.findAll(start, end));
		return mapper.findAll(start,end);
	}

	@Override
	public ArrayList<OfficerDTO> searchStudent(String searchS, String searchT, String searchM) {
		return mapper.searchStudent(searchS, searchT, searchM);
	}

	@Override
	public ArrayList<OfficerDTO> searchAll(String searchS, String searchT) {
		return mapper.searchAll(searchS, searchT);
	}

	@Override
	public OfficerDTO studentInfo(String idNum) {
		OfficerDTO dto = new OfficerDTO();
		dto = mapper.studentInfo(idNum);
		dto.setBirthDate(dto.getResidentNum().substring(0,6));
		return dto;
	}
	
}
