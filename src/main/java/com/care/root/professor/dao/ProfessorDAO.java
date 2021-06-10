package com.care.root.professor.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorDAO {
	public ArrayList<ProfessorDTO> getJuniorList(@Param("position") String position,@Param("grade") String grade);
	public ArrayList<ProfessorDTO> getSeniorList(@Param("position") String position,@Param("grade") String grade);
	public ArrayList<GradeInfoDTO> getGradeInfo(String lecName);
	public int saveScore(GradeInfoDTO dto); //성공하면 성공된 갯수가 int로 넘어감. ex)데이터값이 3개 있다면 3이 넘어감.
}
