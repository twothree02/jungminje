package com.care.root.student.service;

import org.springframework.ui.Model;

public interface StudentService {
	public void studentInfo(Model model, String id);
	public void subjectInfo(Model model, String id);
}
