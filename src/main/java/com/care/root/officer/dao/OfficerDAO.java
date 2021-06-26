package com.care.root.officer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.officer.dto.GradeDTO;
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
	public int selectAdminProCount();
	public ArrayList<OfficerDTO> findAllAdmin(@Param("s") int start, @Param("e") int end);
	public int selectMajorAdminProCount(@Param("major") String major);
	public ArrayList<OfficerDTO> findinfoAdminPro(@Param("major") String major, @Param("s") int start, @Param("e") int end);
	public ArrayList<OfficerDTO> searchAdminPro(@Param("s") int start, @Param("e") int end, 
			@Param("searchS") String searchS, @Param("searchT") String searchT, @Param("searchM") String searchM);
	public int searchAdminProCount(@Param("searchS") String searchS, @Param("searchT") String searchT, @Param("searchM") String searchM);
	public ArrayList<OfficerDTO> searchAllAdminPro(@Param("s") int start, @Param("e") int end, 
            @Param("searchS") String searchS, @Param("searchT") String searchT);
	public int searchAllAdminProCount(@Param("searchS") String searchS, @Param("searchT") String searchT);
	public OfficerDTO adminProInfo(@Param("idNum") String idNum);
	public ArrayList<GradeDTO> grade(@Param("s") int start, @Param("e") int end);
	public Integer totalCal(@Param("idNum") String idNum, @Param("dbSemester") String dbSemester, @Param("dbYear") String dbYear);
	public ArrayList<String> studentIdNum();
	public void insertCurTotalScore(@Param("totalScore") int totalScore, @Param("idNum") String idNum);
	public ArrayList<OfficerDTO> findRankFirst(@Param("s") int start, @Param("e") int end);
	public ArrayList<OfficerDTO> findRankSecond(@Param("s") int start, @Param("e") int end);
	public void insertCurRank();
	public int getTotalGrade(String idNum);
}	
