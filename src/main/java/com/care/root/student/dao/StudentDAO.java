package com.care.root.student.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

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
	public int tuitionSaveA(String id);
	public int tuitionSaveB(String id);
	public int tuitionSaveC(String id); 
	public int tuitionSaveD(String id);
	public TuitionInfoDTO tuitionInfo(String id);
	public int classReq(@Param("id")String id, @Param("classReq")int classReq);
	
	 
}
