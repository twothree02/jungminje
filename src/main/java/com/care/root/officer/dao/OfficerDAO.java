package com.care.root.officer.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.officer.dto.OfficerDTO;

public interface OfficerDAO {
	public OfficerDTO staffInfo(@Param("id") String id);
	public int insertStu(OfficerDTO dto);
	public ArrayList<String> findProfessor(@Param("major") String major);
	public ArrayList<OfficerDTO> findinfo(@Param("major") String major, @Param("s") int start, @Param("e") int end);
	public ArrayList<OfficerDTO> findAll(@Param("s") int start, @Param("e") int end);
	public ArrayList<OfficerDTO> searchStudent(@Param("searchS") String searchS, @Param("searchT") String searchT, @Param("searchM") String searchM);
	public ArrayList<OfficerDTO> searchAll(@Param("searchS") String searchS, @Param("searchT") String searchT);
	public OfficerDTO studentInfo(@Param("idNum") String idNum);
	public int selectStudentCount();
	public int selectMajorStudentCount(@Param("major") String major);
}	
