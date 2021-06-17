package com.care.root.professor.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.ProfessorDTO;
import com.care.root.professor.dto.TimeTableDTO;

public interface ProfessorDAO {
	public ArrayList<ProfessorDTO> getJuniorList(ProfessorDTO dto);
	public ArrayList<ProfessorDTO> getSeniorList(ProfessorDTO dto);
	public ArrayList<ProfessorDTO> getSearchStu(@Param("searchSel") String searchSel,@Param("searchInp") String searchInp);
	public ArrayList<ProfessorDTO> getSearchStaff(@Param("searchName") String searchName,@Param("position") String position);
	public ArrayList<ProfessorDTO> getAdminList(String position);
	public ArrayList<ProfessorDTO> getBProfessorList(@Param("position") String position, @Param("major") String major);
	public ArrayList<ProfessorDTO> getIProfessorList(@Param("position") String position, @Param("major") String major);
	public ArrayList<ProfessorDTO> getCProfessorList(@Param("position") String position, @Param("major") String major);
	public ArrayList<GradeInfoDTO> getGradeInfo(String lecName);
	public ArrayList<TimeTableDTO> getTimeTable(String pId);
	public String getLecCheck(String pId);
	public String getMajorCheck(String pId);
	public int saveScore(GradeInfoDTO dto); //성공하면 성공된 갯수가 int로 넘어감. ex)데이터값이 3개 있다면 3이 넘어감.
	public ArrayList<ProfessorDTO> detailStuInfo(String id);
}
