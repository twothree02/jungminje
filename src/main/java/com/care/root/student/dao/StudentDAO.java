package com.care.root.student.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.care.root.student.dto.StudentInfoDTO;
import com.care.root.student.dto.SubjectDTO;

public interface StudentDAO {
	public StudentInfoDTO studentInfo(String id);
	public ArrayList<SubjectDTO> subjectInfo(@Param("gradeSemester")int gradeSemester, @Param("major")String major);
}
