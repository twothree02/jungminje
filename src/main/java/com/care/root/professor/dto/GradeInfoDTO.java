package com.care.root.professor.dto;

public class GradeInfoDTO {
	private String idNum;
	private String name;
	private String major;
	private String subjectName;
	private String grade;
	private int score;
	private String profName;
	private long receivedCred;
	private long applicationCred;
	private int gradeSeme;
	private String year;
	private String seme;
	private String numGrade;
	
	public String getNumGrade() {
		return numGrade;
	}
	public void setNumGrade(String numGrade) {
		this.numGrade = numGrade;
	}
	public String getSeme() {
		return seme;
	}
	public void setSeme(String seme) {
		this.seme = seme;
	}
	public int getGradeSeme() {
		return gradeSeme;
	}
	public void setGradeSeme(int gradeSeme) {
		this.gradeSeme = gradeSeme;
	}
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
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
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
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
