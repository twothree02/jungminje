package com.care.root.professor.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.ProfessorDTO;
import com.care.root.professor.dto.RegisterInfoDTO;
import com.care.root.professor.dto.TimeTableDTO;

public interface ProfessorDAO {
	public ArrayList<ProfessorDTO> getJuniorList(@Param("major")String major,@Param("s")int start,@Param("e")int end);
	public ArrayList<ProfessorDTO> getSeniorList(@Param("major")String major,@Param("s")int start,@Param("e")int end);
	public ArrayList<ProfessorDTO> getSearchStu(@Param("searchSel") String searchSel,@Param("searchInp") String searchInp,
													@Param("s")int start,@Param("e")int end);
	public ArrayList<ProfessorDTO> getSearchStaff(@Param("searchName") String searchName,@Param("position") String position);
	public ArrayList<ProfessorDTO> getAdminList(@Param("position")String position,@Param("s")int start,@Param("e")int end);
	public ArrayList<ProfessorDTO> getBProfessorList(@Param("s")int start,@Param("e")int end);
	public ArrayList<ProfessorDTO> getIProfessorList(@Param("s")int start,@Param("e")int end);
	public ArrayList<ProfessorDTO> getCProfessorList(@Param("s")int start,@Param("e")int end);
	public ArrayList<GradeInfoDTO> getGradeInfo(@Param("lecName")String lecName,@Param("tYear")String tYear);
	public ArrayList<TimeTableDTO> getTimeTable(String pId);
	public ProfessorDTO getMyInfo(String id);
	public String getLecCheck(String pId);
	public String getMajorCheck(String pId);
	public int saveScore(GradeInfoDTO dto); //성공하면 성공된 갯수가 int로 넘어감. ex)데이터값이 3개 있다면 3이 넘어감.
	public ArrayList<ProfessorDTO> detailStuInfo(String id);
	public ArrayList<GradeInfoDTO> getSemeDetail(@Param("id")String idNum, @Param("seme")int convertSeme);
	public ArrayList<RegisterInfoDTO> semeGradeInfo(String id);
	public Integer selectStuCount(@Param("grade") int grade, @Param("major") String major);
	public Integer searchStuCount(@Param("searchSel") String searchSel,@Param("searchInp") String searchInp);
	public Integer searchAdminCnt(String position);
	public Integer searchBProfCnt();
	public Integer searchIProfCnt();
	public Integer searchCProfCnt();
	public Integer getApplyGrade(String id);
	public Integer getRecGrade(String id);
	public Integer getSemes(String id);
	public double getNetAveGrade(String id);
	public double getNetTotalScore(String id);
	public String getChkPeriod(String pId);
	
}
