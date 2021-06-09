package com.care.root.student.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.student.dao.StudentDAO;
import com.care.root.student.dto.StudentInfoDTO;
import com.care.root.student.dto.SubjectDTO;
import com.care.root.student.dto.TuitionInfoDTO;
import com.care.root.student.dto.TuitionPayDTO;

@Service
public class StudentServiceImpl implements StudentService{
	@Autowired StudentDAO mapper;
	@Override
	public void studentInfo(Model model, String id) {

		try {
			StudentInfoDTO dto = mapper.studentInfo(id);
			String birthDate = dto.getResidentNum().substring(0, 6);
			dto.setBirthDate(birthDate);
			model.addAttribute("info", dto);
		}catch (Exception e) {
			e.printStackTrace();
		}

	}
	@Override
	public void subjectInfo(Model model, String id) {

		try {
			StudentInfoDTO dto = mapper.studentInfo(id);
			String birthDate = dto.getResidentNum().substring(0, 6);
			dto.setBirthDate(birthDate);
			ArrayList<SubjectDTO> list = mapper.subjectInfo(dto.getGradeSemester(), dto.getMajor());
			model.addAttribute("info", dto);
			model.addAttribute("subject", list);
			model.addAttribute("repeat", list.size());
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void tuitionInfo(Model model, String id) {
		StudentInfoDTO infoDTO = mapper.studentInfo(id);
		TuitionInfoDTO tuitionDTO = mapper.tuitionInfo(id);
		model.addAttribute("studentInfo", infoDTO);
		model.addAttribute("tuitionInfo", tuitionDTO);

	}
	
	@Override
	public String tuitionPayment(String id, HttpServletRequest request) {
		String message = null;
		int result = 0;

		TuitionPayDTO payDTO = new TuitionPayDTO();
		StudentInfoDTO infoDTO = mapper.studentInfo(id);
		payDTO.setIdNum(id);
		payDTO.setBank(request.getParameter("bankSelect"));
		payDTO.setAccount(request.getParameter("account"));
		result = mapper.tutionPayMent(payDTO);
		
		if(result == 1) {
			if(infoDTO.getGradeSemester()==101) {
				mapper.tuitionSaveA(id);
			}else if(infoDTO.getGradeSemester()==102){
				mapper.tuitionSaveB(id);
			}
			else if(infoDTO.getGradeSemester()==201) {
				mapper.tuitionSaveC(id);
			}
			else if(infoDTO.getGradeSemester()==202) {
				mapper.tuitionSaveD(id);
			}
			
		}
		System.out.println(id);
		System.out.println(request.getParameter("bankSelect"));
		System.out.println(request.getParameter("account"));
		System.out.println(result);
		
		
		
			/*
			 * if(result == 1) { message = "<script>alert('계좌번호가 정상적으로 등록되었습니다.');"; message
			 * = "location.href=('tuituinChk');</script>"; }else { message =
			 * "<script>alert('계좌번호가 등록에 실패하였습니다.');</script>"; }
			 */
		return message;
	}


}
