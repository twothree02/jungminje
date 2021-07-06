package com.care.root.professor.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.professor.dao.ProfessorDAO;
import com.care.root.professor.dto.AccumInfoDTO;
import com.care.root.professor.dto.GradeInfoDTO;
import com.care.root.professor.dto.MessageDTO;
import com.care.root.professor.dto.ProfessorDTO;

@Service
public class ProfessorServiceImpl implements ProfessorService{
	@Autowired ProfessorDAO pm;
	@Override
	public Map<String, Object> getJuniorList(String major,int num) {
		int pageLetter = 10; //데이터를 몇 개씩 보여줄건가
		int grade = 1; //1학년 학생들에서 학생수를 정의
		int allCount = pm.selectStuCount(grade, major);
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getJuniorList(major,start,end));
		result.put("repeat",repeat);
		
		return result;
	}
	public Map<String, Object> getSeniorList(String major,int num) {
		int pageLetter = 10; 
		int grade = 2; //2학년 학생들에서 학생수를 정의
		int allCount = pm.selectStuCount(grade, major);
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getSeniorList(major,start,end));
		result.put("repeat",repeat);
		
		return result;
	}
	@Override
	public Map<String, Object> getSearchStu(String searchSel, String searchInp, int num) {
		int pageLetter = 10; 
		int allCount = pm.searchStuCount(searchSel, searchInp);
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getSearchStu(searchSel, searchInp, start, end));
		result.put("repeat",repeat);
		
		
		return result;
	}
	@Override
	public ArrayList<ProfessorDTO> getSearchStaff(String searchName, String position) {
	
		return pm.getSearchStaff(searchName, position);
	}
	@Override
	public Map<String, Object> getBProfessorList(int num) {
		int pageLetter = 10; 
		int allCount = pm.searchBProfCnt();
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getBProfessorList(start, end));
		result.put("repeat",repeat);
		
		
		return result;
	}
	@Override
	public Map<String, Object> getIProfessorList(int num) {
		int pageLetter = 10; 
		int allCount = pm.searchIProfCnt();
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getIProfessorList(start, end));
		result.put("repeat",repeat);
		
		
		return result;
	}
	@Override
	public Map<String, Object> getCProfessorList(int num) {
		int pageLetter = 10; 
		int allCount = pm.searchCProfCnt();
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getCProfessorList(start, end));
		result.put("repeat",repeat);
		
		
		return result;
	}
	@Override
	public Map<String, Object> getAdminList(String position, int num) {
		int pageLetter = 10; 
		int allCount = pm.searchAdminCnt(position);
		
		int repeat = allCount / pageLetter;	// 총 페이지 수
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter; //해당 페이지 마지막 게시글 번호
		int start = end + 1 - pageLetter; //해당 페이지 처음 게시글 번호
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", pm.getAdminList(position, start, end));
		result.put("repeat", repeat);
		
		
		return result;
	}
	
	@Override
	public void showMyInfo(Model model, String id) {
		model.addAttribute("myInfo", pm.getMyInfo(id));
		
	}
	@Override
	public void showTimeTable(Model model, String pId) {
		model.addAttribute("timeTable", pm.getTimeTable(pId));
		
	}
	@Override
	public String lecCheck(String pId) {
		
		return pm.getLecCheck(pId);
	}
	@Override
	public String majorCheck(String pId) {
		
		return pm.getMajorCheck(pId);
	}
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return super.hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		super.finalize();
	}
	@Override
	public void showGrade(Model model, String lecName, String tYear) {
		model.addAttribute("gradeInfo", pm.getGradeInfo(lecName, tYear)); //성적입력에 넣을 값
	}
	@Override
	public String inputGrade(MultipartHttpServletRequest mul, HttpServletRequest request, String pId){
		GradeInfoDTO dto = new GradeInfoDTO();
		
		Map<String, String> mapScore = new HashMap<String,String>();

		String[] arrScore = mul.getParameterValues("inputScore");
		String[] arrId = mul.getParameterValues("keyId");
		
		String subName = pm.getLecCheck(pId);
		
		Calendar cal = Calendar.getInstance();
		String tYear = cal.get(Calendar.YEAR)+"";
		String tSeme = "1";
		int month = cal.get(Calendar.MONTH);
		if(month>6) {
			tSeme = "2";
		}
		
		for(int i=0;i<=arrId.length-1;i++) {
			mapScore.put(arrId[i], arrScore[i]);
			System.out.println(mapScore);
			int test01 = Integer.parseInt(arrScore[i]);
			System.out.println(test01);
				
			dto.setSubjectName(subName);
			dto.setYear(tYear);
			dto.setSeme(tSeme);
			dto.setIdNum(arrId[i]);
			dto.setScore(Integer.parseInt(arrScore[i]));
			dto.setGrade(convertGrade(Integer.parseInt(arrScore[i])));
			if(convertGrade(Integer.parseInt(arrScore[i])).equals("F")) {
				dto.setReceivedCred(0);
			}else {
				dto.setReceivedCred(3);
			}
			dto.setNumGrade(convertNumGrade(Integer.parseInt(arrScore[i])));
			System.out.println(dto.getYear());
			System.out.println(dto.getSeme());
			pm.saveScore(dto);
		}
		
		dto.setIdNum(arrId[arrId.length-1]);
		dto.setScore(Integer.parseInt(arrScore[arrScore.length-1]));
		dto.setGrade(convertGrade(Integer.parseInt(arrScore[arrScore.length-1])));
		dto.setNumGrade(convertNumGrade(Integer.parseInt(arrScore[arrScore.length-1])));

		int result = pm.saveScore(dto);

		MessageDTO mDTO = new MessageDTO();
		mDTO.setResult(result);
		System.out.println(result); //test용
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 저장되었습니다.");
		mDTO.setSuccessURL("/professor/show_grade");
		mDTO.setFailMessage("입력 중 문제가 발생하였습니다.");
		mDTO.setFailURL("/professor/show_grade");
		String message = showMessage(mDTO);
		return message;
		
	}

	public String convertGrade(int score) {
		//0미만 100초과 밑 문자 오류처리 필요, 잘못 입력했을 때 try catch
			if(score>=95) return "A+";
			else if(score>=90) return "A";
			else if(score>=85) return "B+";
			else if(score>=80) return "B";
			else if(score>=75) return "C+";
			else if(score>=70) return "C";
			else if(score>=60) return "D";
			else return "F";
	}
	public String convertNumGrade(int score) {
			if(score>=95) return "4.5";
			else if(score>=90) return "4.0";
			else if(score>=85) return "3.5";
			else if(score>=80) return "3.0";
			else if(score>=75) return "2.5";
			else if(score>=70) return "2.0";
			else if(score>=60) return "1.0";
			else return "0";
	}
	public String showMessage(MessageDTO dto) {
		String message = null;
		String path = dto.getRequest().getContextPath();
		if(dto.getResult() >= 1) {
			message = "<script>alert('"+dto.getSuccessMessage()+"');";
			message += "location.href='"+path+dto.getSuccessURL()+"';</script>";
		}else {
			message = "<script>alert('"+dto.getFailMessage()+"');";
			message += "location.href='"+path+dto.getFailURL()+"';</script>";
		}
		return message;
	}
	@Override
	public void detailStuInfo(Model model, String id) {
		System.out.println(id);
		model.addAttribute("detailStuInfo", pm.detailStuInfo(id));
	}
	@Override
	public ArrayList<GradeInfoDTO> getSemeDetail(String idNum, String gSeme) {
		int inputSeme = Integer.parseInt(gSeme);
		System.out.println(inputSeme);
		int convertSeme = 0;
		if(inputSeme == 101) convertSeme = 1;
		if(inputSeme == 102) convertSeme = 2;
		if(inputSeme == 201) convertSeme = 3;
		if(inputSeme == 202) convertSeme = 4;
		System.out.println(convertSeme);
		
		return pm.getSemeDetail(idNum, convertSeme);
	}
	@Override
	public void semeGrade(Model model, String id) {
		model.addAttribute("semeGradeInfo",pm.semeGradeInfo(id));
	}
	@Override
	public void accumulatedGrade(Model model, String id) {
		try {
			//데이터가 없을 경우 연산이 전혀 될 수 없으니 오류가 발생. 따라서 꼭! try catch로 묶을 것.
			int applyGrade = pm.getApplyGrade(id); //신청 학점 가져오기
			int receivedGrade = pm.getRecGrade(id); //받은 학점 가져오기(F제외)
			
			
			double semes = (double)pm.getSemes(id);
			
			double netAveGrade = pm.getNetAveGrade(id); //평점의 합 가져오기
			double aveGrade = Math.round((netAveGrade/semes)*100)/100.0; //평점 평균(소수 둘째자리까지)
			double netTotalScore = pm.getNetTotalScore(id); //환산점수의 합
			double totalScore = Math.round((netTotalScore/semes)*100)/100.0; //평균 환산점수
			
			System.out.println(applyGrade);
			System.out.println(receivedGrade);
			System.out.println(aveGrade);
			System.out.println(totalScore);
			
			AccumInfoDTO dto = new AccumInfoDTO();
			dto.setApplyGrade(applyGrade);
			dto.setReceivedGrade(receivedGrade);
			dto.setAveGrade(aveGrade);
			dto.setTotalScore(totalScore);
			model.addAttribute("accumInfo",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public String chkPeriod(String pId) {
		return pm.getChkPeriod(pId);
	}
	
	
	
	
}
