package com.care.root.student.dto;

public class RegisterInfoDTO {
	private String major;
	private String idNum;
	private String name;
	private int scholarship;
	private double totalScore;
	private int rank;
	private String year;
	private int gradeSemester;
	private String chkPeriod;
	
	public String getChkPeriod() {
		return chkPeriod;
	}
	public void setChkPeriod(String chkPeriod) {
		this.chkPeriod = chkPeriod;
	}
	
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
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
	public int getScholarship() {
		return scholarship;
	}
	public void setScholarship(int scholarship) {
		this.scholarship = scholarship;
	}
	public double getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getGradeSemester() {
		return gradeSemester;
	}
	public void setGradeSemester(int gradeSemester) {
		this.gradeSemester = gradeSemester;
	}
	
	
	
}
