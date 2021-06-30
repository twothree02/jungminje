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
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			String birthDate = infoDTO.getResidentNum().substring(0, 6);
			infoDTO.setBirthDate(birthDate);
			if(infoDTO.getGradeSemester() == 1) {
				infoDTO.setGradeSemester(101);
			}else if(infoDTO.getGradeSemester() == 2) {
				infoDTO.setGradeSemester(102);
			}else if(infoDTO.getGradeSemester() == 3) {
				infoDTO.setGradeSemester(201);
			}else if(infoDTO.getGradeSemester() == 4) {
				infoDTO.setGradeSemester(202);
			}
			model.addAttribute("info", infoDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void subjectInfo(Model model, String id) {

		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			String birthDate = infoDTO.getResidentNum().substring(0, 6);
			infoDTO.setBirthDate(birthDate);
			ArrayList<SubjectDTO> list = null;
			
			/*if (infoDTO.getGradeSemester() == infoDTO.getClassReq()) {
				list = mapper.subjectInfoA(infoDTO.getGradeSemester(), infoDTO.getMajor());
			} else {
				list = mapper.subjectInfoB(infoDTO.getGradeSemester(), infoDTO.getMajor());
			}*/
			list = mapper.subjectInfoA(infoDTO.getClassReq(), infoDTO.getMajor());
			

			if(infoDTO.getGradeSemester() == 1) {
				infoDTO.setGradeSemester(101);
			}else if(infoDTO.getGradeSemester() == 2) {
				infoDTO.setGradeSemester(102);
			}else if(infoDTO.getGradeSemester() == 3) {
				infoDTO.setGradeSemester(201);
			}else if(infoDTO.getGradeSemester() == 4) {
				infoDTO.setGradeSemester(202);
			}
			
			model.addAttribute("info", infoDTO);
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
			if(infoDTO.getGradeSemester() == 1) {
				infoDTO.setGradeSemester(101);
			}else if(infoDTO.getGradeSemester() == 2) {
				infoDTO.setGradeSemester(102);
			}else if(infoDTO.getGradeSemester() == 3) {
				infoDTO.setGradeSemester(201);
			}else if(infoDTO.getGradeSemester() == 4) {
				infoDTO.setGradeSemester(202);
			}
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
			if (infoDTO.getGradeSemester() == 1) {
				mapper.tuitionSaveA(id, year);
			} else if (infoDTO.getGradeSemester() == 2) {
				mapper.tuitionSaveB(id, year);
			} else if (infoDTO.getGradeSemester() == 3) {
				mapper.tuitionSaveC(id, year);
			} else if (infoDTO.getGradeSemester() == 4) {
				mapper.tuitionSaveD(id, year);
			}

		}

		/*
		 * if(result == 1) { message = "<script>alert('계좌번호가 정상적으로 등록되었습니다.');"; message
		 * = "location.href=('tuituinChk');</script>"; }else { message =
		 * "<script>alert('계좌번호가 등록에 실패하였습니다.');</script>"; }
		 */
		return message;
	}

	@Override
	public void classRequest(Model model, String id) {
		
		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			StudentInfoDTO infoDTOC = mapper.studentInfo(id);
			ArrayList<SubjectDTO> list = mapper.subjectInfoC(infoDTO.getGradeSemester(), infoDTO.getMajor());
			
			model.addAttribute("infoC", infoDTOC);
				if(infoDTO.getGradeSemester() == 1) {
					infoDTO.setGradeSemester(101);
				}else if(infoDTO.getGradeSemester() == 2) {
					infoDTO.setGradeSemester(102);
				}else if(infoDTO.getGradeSemester() == 3) {
					infoDTO.setGradeSemester(201);
				}else if(infoDTO.getGradeSemester() == 4) {
					infoDTO.setGradeSemester(202);
				}
			model.addAttribute("info", infoDTO);
			model.addAttribute("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	}

	@Override
	public void classReqChk(String id) {
		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			mapper.classReq(id, infoDTO.getGradeSemester());
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy");
			String year = format.format(date);
			ArrayList<SubjectDTO> list = mapper.subjectInfoC(infoDTO.getGradeSemester(), infoDTO.getMajor());
			
			
			for (SubjectDTO subjectDTO : list) {
				GradeDTO gradeDTO = new GradeDTO();
				gradeDTO.setMajor(infoDTO.getMajor());
				gradeDTO.setIdNum(infoDTO.getIdNum());
				gradeDTO.setName(infoDTO.getName());
				gradeDTO.setSubjectName(subjectDTO.getSubjectName());
				gradeDTO.setProfName(subjectDTO.getProfessor());
				gradeDTO.setYear(year);
				gradeDTO.setSemester(infoDTO.getGradeSemester());
				gradeDTO.setApplicationCred(3);
				String semester = null;
				if(infoDTO.getGradeSemester() == 1 || infoDTO.getGradeSemester() == 3) {
					semester = "1";
				}else {
					semester = "2";
				}
				gradeDTO.setSemester2(semester);
				mapper.insertRegInfo(gradeDTO);
			} 
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			
		
	}

	@Override
	public void gradeInquiry(Model model, String id) {
		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			List<GradeDTO> list = mapper.gradeInfo(id, infoDTO.getGradeSemester());
			RegisterInfoDTO RegDTO = mapper.registerInfo(id, infoDTO.getGradeSemester());
			
			if(RegDTO != null) {
				model.addAttribute("period", RegDTO.getChkPeriod());
			}else {
				model.addAttribute("period", "N");
			}
			
			int repeat = 0;
			if (RegDTO == null || RegDTO.getChkPeriod() != "Y") {		
					repeat = 1;
			}else{
					repeat = list.size();
			}
			model.addAttribute("repeat", repeat);
			
			if(infoDTO.getGradeSemester() == 1) {
				infoDTO.setGradeSemester(101);
			}else if(infoDTO.getGradeSemester() == 2) {
				infoDTO.setGradeSemester(102);
			}else if(infoDTO.getGradeSemester() == 3) {
				infoDTO.setGradeSemester(201);
			}else if(infoDTO.getGradeSemester() == 4) {
				infoDTO.setGradeSemester(202);
			}
			
			model.addAttribute("info", infoDTO);
			model.addAttribute("grade", list);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<GradeDTO> detailGrade(int semester, String id) {
		List<GradeDTO> list = mapper.gradeInfo(id, semester);
		for (GradeDTO dto : list) {
			if(dto.getSemester() == 1) {
				dto.setSemester(101);
			}else if(dto.getSemester() == 2) {
				dto.setSemester(102);
			}else if(dto.getSemester() == 3) {
				dto.setSemester(201);
			}else if(dto.getSemester() == 4) {
				dto.setSemester(202);
			}
		}
		
		return list;
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
		DecimalFormat frmt = new DecimalFormat("#.##"); //포맷을 바꾸면 double에서 String으로 타입 변화
		List<GradeDTO> list = null;

		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			String birthDate = infoDTO.getResidentNum().substring(0, 6);
			infoDTO.setBirthDate(birthDate);
			model.addAttribute("info", infoDTO);

			for (int i = 1; i < infoDTO.getGradeSemester(); i++) {
				applicationCred = 0;
				receivedCred = 0;
				avgGrade = 0;
				int semester = i;
				registerDTO = null;
				list = null;
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
				if(infoDTO.getGradeSemester() >= i) {
					model.addAttribute("rankCnt"+i, mapper.rankCnt(infoDTO.getMajor(), registerDTO.getYear(), i));
				}
				
				
			}

			// total
			TotalGradeDTO tGradeDTO = new TotalGradeDTO();
			tAvgGrade = tAvgGrade / (tApplicationCred / 3);
			tAvgGrade2 = frmt.format(tAvgGrade);

			tScore = (tScore - tAvgGrade) * 10;
			tScore = 99 - tScore;
			tScore2 = frmt.format(tScore);
			
			//1학년 1학기의 경우에는 학기별 성적 조회 불가능하게 하기 위하여 진행
			if(infoDTO.getGradeSemester() > 1) {
				tGradeDTO.settApplicationCred(tApplicationCred);
				tGradeDTO.settReceivedCred(tReceivedCred);
				tGradeDTO.settAvgGrade(tAvgGrade2);
				tGradeDTO.settScore(tScore2);
			}else {
				tGradeDTO.settApplicationCred(0);
				tGradeDTO.settReceivedCred(0);
				tGradeDTO.settAvgGrade("0");
				tGradeDTO.settScore("0");
			}

			model.addAttribute("total", tGradeDTO);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void totalInquiry_T(Model model, String id) {
		
		try {
			StudentInfoDTO infoDTO = mapper.studentInfo(id);
			String birthDate = infoDTO.getResidentNum().substring(0, 6);
			infoDTO.setBirthDate(birthDate);
			model.addAttribute("info", infoDTO);
			TuitionInfoDTO tuitionDTO = mapper.tuitionInfo(id);
			model.addAttribute("tuition", tuitionDTO);
			ArrayList<RegisterInfoDTO> list = mapper.totalRegisterInfo(id);
			RegisterInfoDTO registerDTOA = mapper.registerInfo(id, 1);
			RegisterInfoDTO registerDTOB = mapper.registerInfo(id, 2);
			RegisterInfoDTO registerDTOC = mapper.registerInfo(id, 3);
			RegisterInfoDTO registerDTOD = mapper.registerInfo(id, 4);
			
			for (RegisterInfoDTO dto : list) {
				if(dto.getGradeSemester() == 1) {
					dto.setGradeSemester(101);
				}else if(dto.getGradeSemester() == 2) {
					dto.setGradeSemester(102);
				}else if(dto.getGradeSemester() == 3) {
					dto.setGradeSemester(201);
				}else if(dto.getGradeSemester() == 4) {
					dto.setGradeSemester(202);
				}
			}
			
			model.addAttribute("RegList", list);
			model.addAttribute("registerA", registerDTOA);
			model.addAttribute("registerB", registerDTOB);
			model.addAttribute("registerC", registerDTOC);
			model.addAttribute("registerD", registerDTOD);
			
			if (list.size() == 0) {
				model.addAttribute("repeat", 1);
			} else {
				model.addAttribute("repeat", list.size());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
