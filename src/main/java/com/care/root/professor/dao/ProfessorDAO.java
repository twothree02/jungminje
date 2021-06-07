package com.care.root.professor.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.professor.dto.ProfessorDTO;

public interface ProfessorDAO {
	public ArrayList<ProfessorDTO> getJuniorList(@Param("position") String position,@Param("grade") String grade);
}
