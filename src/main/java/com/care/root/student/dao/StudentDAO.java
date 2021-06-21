package com.care.root.student.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.student.dto.GradeDTO;
import com.care.root.student.dto.RegisterInfoDTO;
import com.care.root.student.dto.StudentInfoDTO;
import com.care.root.student.dto.SubjectDTO;
import com.care.root.student.dto.TuitionInfoDTO;
import com.care.root.student.dto.TuitionPayDTO;

public interface StudentDAO {
	public StudentInfoDTO studentInfo(String id);
	public ArrayList<SubjectDTO> subjectInfoA(@Param("gradeSemester")int gradeSemester, @Param("major")String major);
	public ArrayList<SubjectDTO> subjectInfoB(@Param("gradeSemester")int gradeSemester, @Param("major")String major);
	public ArrayList<SubjectDTO> subjectInfoC(@Param("gradeSemester")int gradeSemester, @Param("major")String major);
	public int tutionPayMent(TuitionPayDTO dto);
	public int tuitionSaveA(@Param("id")String id, @Param("year")String year);
	public int tuitionSaveB(@Param("id")String id, @Param("year")String year);
	public int tuitionSaveC(@Param("id")String id, @Param("year")String year); 
	public int tuitionSaveD(@Param("id")String id, @Param("year")String year);
	public TuitionInfoDTO tuitionInfo(String id);
	public int classReq(@Param("id")String id, @Param("classReq")int classReq);
	public List<GradeDTO> gradeInfo(@Param("id")String id, @Param("semester")int semester);
	public RegisterInfoDTO registerInfo(@Param("id")String id, @Param("semester")int semester);
	public ArrayList<RegisterInfoDTO> totalRegisterInfo(String id);
	
	 
}
