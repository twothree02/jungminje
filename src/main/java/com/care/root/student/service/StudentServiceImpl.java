package com.care.root.student.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.student.dao.StudentDAO;
import com.care.root.student.dto.GradeDTO;
import com.care.root.student.dto.RegisterInfoDTO;
import com.care.root.student.dto.SemesterGradeDTO;
import com.care.root.student.dto.StudentInfoDTO;
import com.care.root.student.dto.SubjectDTO;
import com.care.root.student.dto.TotalGradeDTO;
import com.care.root.student.dto.TuitionInfoDTO;
import com.care.root.student.dto.TuitionPayDTO;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	StudentDAO mapper;

	@Override
	public void studentInfo(Model model, String id) {

		try {
			StudentInfoDTO dto = mapper.studentInfo(id);
			String birthDate = dto.getResidentNum().substring(0, 6);
			dto.setBirthDate(birthDate);
			model.addAttribute("info", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void subjectInfo(Model model, String id) {

		try {
			StudentInfoDTO dto = mapper.studentInfo(id);
			String birthDate = dto.getResidentNum().substring(0, 6);
			dto.setBirthDate(birthDate);
			ArrayList<SubjectDTO> list = null;
			if (dto.getGradeSemester() == dto.getClassReq()) {
				list = mapper.subjectInfoA(dto.getGradeSemester(), dto.getMajor());
			} else {
				list = mapper.subjectInfoB(dto.getGradeSemester(), dto.getMajor());
			}

			model.addAttribute("info", dto);
			model.addAttribute("subject", list);
			if (list.size() == 0) {
				model.addAttribute("repeat", 1);
			} else {
				model.addAttribute("repeat", list.size());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void tuitionInfo(Model model, String id) {
		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			TuitionInfoDTO tuitionDTO = mapper.tuitionInfo(id);
			model.addAttribute("studentInfo", infoDTO);
			model.addAttribute("tuitionInfo", tuitionDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public String tuitionPayment(String id, HttpServletRequest request) {
		String message = null;
		int result = 0;
		
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy");
		String year = format.format(date);
		
		TuitionPayDTO payDTO = new TuitionPayDTO();
		StudentInfoDTO infoDTO = mapper.studentInfo(id);
		payDTO.setIdNum(id);
		payDTO.setBank(request.getParameter("bankSelect"));
		payDTO.setAccount(request.getParameter("account"));
		result = mapper.tutionPayMent(payDTO);

		if (result == 1) {
			if (infoDTO.getGradeSemester() == 101) {
				mapper.tuitionSaveA(id, year);
			} else if (infoDTO.getGradeSemester() == 102) {
				mapper.tuitionSaveB(id, year);
			} else if (infoDTO.getGradeSemester() == 201) {
				mapper.tuitionSaveC(id, year);
			} else if (infoDTO.getGradeSemester() == 202) {
				mapper.tuitionSaveD(id, year);
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

	@Override
	public void classRequest(Model model, String id) {
		StudentInfoDTO infoDTO = mapper.studentInfo(id);
		ArrayList<SubjectDTO> list = mapper.subjectInfoC(infoDTO.getGradeSemester(), infoDTO.getMajor());
		model.addAttribute("info", infoDTO);
		model.addAttribute("list", list);

	}

	@Override
	public void classReqChk(String id) {
		StudentInfoDTO infoDTO = mapper.studentInfo(id);
		mapper.classReq(id, infoDTO.getGradeSemester());
	}

	@Override
	public void gradeInquiry(Model model, String id) {
		StudentInfoDTO infoDTO = mapper.studentInfo(id);
		List<GradeDTO> list = mapper.gradeInfo(id, infoDTO.getGradeSemester());
		if (list.size() == 0) {
			model.addAttribute("repeat", 1);
		} else {
			model.addAttribute("repeat", list.size());
		}
		model.addAttribute("info", infoDTO);
		model.addAttribute("grade", list);

	}

	@Override
	public List<GradeDTO> detailGrade(int semester, String id) {

		return mapper.gradeInfo(id, semester);
	}

	@Override
	public void totalInquiry_G(Model model, String id) {
		int applicationCred = 0;
		int receivedCred = 0;
		double avgGrade = 0;
		String avgGrade2 = null;

		int tApplicationCred = 0;
		int tReceivedCred = 0;
		double tAvgGrade = 0;
		String tAvgGrade2 = null;
		double tScore = 4.5;
		String tScore2 = null;
		
		RegisterInfoDTO registerDTO = null;
		DecimalFormat frmt = new DecimalFormat(); //포맷을 바꾸면 double에서 String으로 타입 변화
		List<GradeDTO> list = null;

		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			String birthDate = infoDTO.getResidentNum().substring(0, 6);
			infoDTO.setBirthDate(birthDate);
			model.addAttribute("info", infoDTO);

			for (int i = 1; i <= 4; i++) {
				applicationCred = 0;
				receivedCred = 0;
				avgGrade = 0;
				int semester = 0;

				registerDTO = null;
				list = null;
				if (i == 1) {
					semester = 101;
				} else if (i == 2) {
					semester = 102;
				} else if (i == 3) {
					semester = 201;
				} else {
					semester = 202;
				}
				registerDTO = mapper.registerInfo(id, semester);
				list = mapper.gradeInfo(id, semester);

				if (list.size() != 0) {

					for (GradeDTO gradeDTO : list) {
						applicationCred += gradeDTO.getApplicationCred();
						receivedCred += gradeDTO.getReceivedCred();
						if (gradeDTO.getScore() >= 95) {
							avgGrade += 4.5;
						} else if (gradeDTO.getScore() < 95 && gradeDTO.getScore() >= 90) {
							avgGrade += 4.0;
						} else if (gradeDTO.getScore() < 90 && gradeDTO.getScore() >= 85) {
							avgGrade += 3.5;
						} else if (gradeDTO.getScore() < 85 && gradeDTO.getScore() >= 80) {
							avgGrade += 3.0;
						} else if (gradeDTO.getScore() < 80 && gradeDTO.getScore() >= 75) {
							avgGrade += 2.5;
						} else if (gradeDTO.getScore() < 75 && gradeDTO.getScore() >= 70) {
							avgGrade += 2.0;
						} else if (gradeDTO.getScore() < 70 && gradeDTO.getScore() >= 65) {
							avgGrade += 1.0;
						} else {
							avgGrade += 0.0;
						}

					}

					tApplicationCred += applicationCred;
					tReceivedCred += receivedCred;
					tAvgGrade += avgGrade;

					SemesterGradeDTO SgradeDTO = new SemesterGradeDTO();
					avgGrade = avgGrade / (applicationCred / 3);
					avgGrade2 = frmt.format(avgGrade);

					SgradeDTO.setApplicationCred(applicationCred);
					SgradeDTO.setReceivedCred(receivedCred);
					SgradeDTO.setAvgGrade(avgGrade2);
					SgradeDTO.setRank(registerDTO.getRank());
					model.addAttribute("grade"+semester, SgradeDTO);
				}
			}

			// total
			TotalGradeDTO tGradeDTO = new TotalGradeDTO();
			tAvgGrade = tAvgGrade / (tApplicationCred / 3);
			tAvgGrade2 = frmt.format(tAvgGrade);

			tScore = (tScore - tAvgGrade) * 10;
			tScore = 99 - tScore;
			tScore2 = frmt.format(tScore);

			tGradeDTO.settApplicationCred(tApplicationCred);
			tGradeDTO.settReceivedCred(tReceivedCred);
			tGradeDTO.settAvgGrade(tAvgGrade2);
			tGradeDTO.settScore(tScore2);

			model.addAttribute("total", tGradeDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
