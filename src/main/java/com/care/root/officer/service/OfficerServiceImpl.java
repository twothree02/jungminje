package com.care.root.officer.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.officer.dao.OfficerDAO;
import com.care.root.officer.dto.OfficerDTO;
import com.care.root.officer.dto.TimeTableDTO;

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
	public Map<String, Object> findinfo(String major,int num) {
		int pageLetter = 3;
		int allCount;
		if(major.equals("전체")) {
			allCount = mapper.selectStudentCount(); // 총 글 개수 얻어오기
		}
		else {
			allCount = mapper.selectMajorStudentCount(major); // 총 글 개수 얻어오기
		}
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		if(major.equals("전체")) {
			Map <String,Object> map = new HashMap<String, Object>();
			map.put("repeat", repeat);
			map.put("list", mapper.findAll(start, end));
			return map;
		}
		else {
			Map <String,Object> map = new HashMap<String, Object>();
			map.put("repeat", repeat);
			map.put("list", mapper.findinfo(major, start, end));
			return map;
		}
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
	public Map<String, Object> searchStudent(String searchS, String searchT, String searchM, int num) {
		int pageLetter = 3;
		int allCount = mapper.searchStudentCount(searchS, searchT, searchM); // 총 글 개수 얻어오기
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		System.out.println(num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", mapper.searchStudent(start, end, searchS, searchT, searchM));
		return map;
	}

	@Override
	public Map<String, Object> searchAll(String searchS, String searchT, int num) {
		int pageLetter = 3;
		int allCount = mapper.searchAllCount(searchS, searchT); // 총 글 개수 얻어오기
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		
		System.out.println(num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("repeat", repeat);
		map.put("list", mapper.searchAll(start, end, searchS, searchT));
		return map;
	}

	@Override
	public OfficerDTO studentInfo(String idNum) {
		OfficerDTO dto = new OfficerDTO();
		dto = mapper.studentInfo(idNum);
		dto.setBirthDate(dto.getResidentNum().substring(0,6));
		return dto;
	}

	@Override
	public ArrayList<String> findSubject(String major) {
		ArrayList<String> list = new ArrayList<String>();
		if(mapper.AlreadySubject(major).size() != 0) {
			int i = 0;
			while(i < mapper.findSubject(major).size()) {
				String fs = mapper.findSubject(major).get(i);
				for(int j = 0; j<mapper.AlreadySubject(major).size(); j++) {
					String as = mapper.AlreadySubject(major).get(j);
					if(fs.equals(as) == false) {
						list.add(fs);
					}
				}
			}
		}
		else {
			for(int i = 0; i < mapper.findSubject(major).size(); i++) {
				String fs = mapper.findSubject(major).get(i);
				list.add(fs);
			}
		}
		return list;
	}

	@Override
	public ArrayList<String> findLecture(String major) {
		return mapper.findLecture(major);
	}

	@Override
	public ArrayList<String> findTeacher(String subject) {
		ArrayList<String> list = new ArrayList<String>();
		if (mapper.findTeacher(subject) == null) {
			list.add(" ");
		}
		else {
			list.add(mapper.findTeacher(subject));
		}
		if(mapper.findTeacherIdNum(subject) == null) {
			list.add(" ");
		}
		else {
			list.add(mapper.findTeacherIdNum(subject));
		}
		return list;
	}

	@Override
	public int insertTimeTable(HttpServletRequest request) {
		TimeTableDTO dto = new TimeTableDTO();
		
		dto.setYearSemester(request.getParameter("semester"));
		dto.setMajor(request.getParameter("major"));
		dto.setSubject(request.getParameter("subject"));
		dto.setProfessor(request.getParameter("professorName"));
		dto.setIdNum(request.getParameter("professorIdNum"));
		dto.setLectureRoom(request.getParameter("lecture"));
		dto.setTime(request.getParameter("time"));
		dto.setWeek(request.getParameter("week"));
		
		try {
			return mapper.insertTimeTable(dto);
		}
		catch (Exception e){
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public ArrayList<String> timeCheck(String major, String week, String lecture) {
		ArrayList <String> finalTime = new ArrayList<String>();
		String firstTime = "09:00 ~ 12:00";
		String secondTime = "12:00 ~ 15:00";
		String thirdTime = "15:00 ~ 18:00";
		String fourthTime = "18:00 ~ 21:00";
		if(mapper.findTime(major, week, lecture).size() != 0) {
			for(int i = 0; i<mapper.findTime(major, week, lecture).size(); i++) {
				if(mapper.findTime(major, week, lecture).get(i).equals(firstTime) == false){
					finalTime.add(firstTime);
				}
				if(mapper.findTime(major, week, lecture).get(i).equals(secondTime) == false){
					finalTime.add(secondTime);
				}
				if(mapper.findTime(major, week, lecture).get(i).equals(thirdTime) == false){
					finalTime.add(thirdTime);
				}
				if(mapper.findTime(major, week, lecture).get(i).equals(fourthTime) == false){
					finalTime.add(fourthTime);
				}
			}
		}
		else {
			finalTime.add(firstTime); finalTime.add(secondTime); finalTime.add(thirdTime); finalTime.add(fourthTime);
		}
		return finalTime;
	}
	
}
