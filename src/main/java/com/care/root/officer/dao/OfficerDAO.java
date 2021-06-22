package com.care.root.officer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.officer.dto.OfficerDTO;
import com.care.root.officer.dto.TimeTableDTO;

public interface OfficerDAO {
	public OfficerDTO staffInfo(@Param("id") String id);
	public int insertStu(OfficerDTO dto);
	public ArrayList<String> findProfessor(@Param("major") String major);
	public ArrayList<OfficerDTO> findinfo(@Param("major") String major, @Param("s") int start, @Param("e") int end);
	public ArrayList<OfficerDTO> findAll(@Param("s") int start, @Param("e") int end);
	public ArrayList<OfficerDTO> searchStudent(@Param("s") int start, @Param("e") int end, 
								@Param("searchS") String searchS, @Param("searchT") String searchT, @Param("searchM") String searchM);
	public int searchStudentCount(@Param("searchS") String searchS, @Param("searchT") String searchT, @Param("searchM") String searchM);
	public ArrayList<OfficerDTO> searchAll(@Param("s") int start, @Param("e") int end, 
			                                 @Param("searchS") String searchS, @Param("searchT") String searchT);
	public int searchAllCount(@Param("searchS") String searchS, @Param("searchT") String searchT);
	public OfficerDTO studentInfo(@Param("idNum") String idNum);
	public int selectStudentCount();
	public int selectMajorStudentCount(@Param("major") String major);
	public ArrayList<String> findSubject(@Param("major") String major);
	public ArrayList<String> AlreadySubject(@Param("major") String major);
	public ArrayList<String> findLecture(@Param("major") String major);
	public String findTeacher(@Param("subject") String subject);
	public String findTeacherIdNum(@Param("subject") String subject);
	public int insertTimeTable(TimeTableDTO dto);
	public ArrayList<String> findTime(@Param("major") String major, @Param("week") String week, @Param("lecture") String lecture);
}	
