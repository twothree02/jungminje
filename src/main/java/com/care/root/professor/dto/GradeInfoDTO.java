package com.care.root.professor.dto;

public class GradeInfoDTO {
	private String idNum;
	private String name;
	private String majorSeme;
	private String subjectName;
	private String grade;
	private int score;
	private String profName;
	private long receivedCred;
	private long applicationCred;
	
	public String getIdNum() {
		return idNum;
	}
	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMajorSeme() {
		return majorSeme;
	}
	public void setMajorSeme(String majorSeme) {
		this.majorSeme = majorSeme;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getProfName() {
		return profName;
	}
	public void setProfName(String profName) {
		this.profName = profName;
	}
	public long getReceivedCred() {
		return receivedCred;
	}
	public void setReceivedCred(long receivedCred) {
		this.receivedCred = receivedCred;
	}
	
	public long getApplicationCred() {
		return applicationCred;
	}
	public void setApplicationCred(long applicationCred) {
		this.applicationCred = applicationCred;
	}
}
