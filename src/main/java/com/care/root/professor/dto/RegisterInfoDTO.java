package com.care.root.professor.dto;

public class RegisterInfoDTO {
	private String major;
	private String idNum;
	private String name;
	private int scholarship;
	private double totalScore;
	private int rank;
	private String year;
	private int gradeSeme;
	private String chkPeriod;
	private double aveGrade;
	private int appCred;
	private int receivedCred;
	private int mjSeme;


	
	public int getMjSeme() {
		return mjSeme;
	}
	public void setMjSeme(int mjSeme) {
		this.mjSeme = mjSeme;
	}
	public double getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}
	public double getAveGrade() {
		return aveGrade;
	}
	public void setAveGrade(double aveGrade) {
		this.aveGrade = aveGrade;
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
	public int getGradeSeme() {
		return gradeSeme;
	}
	public void setGradeSeme(int gradeSeme) {
		this.gradeSeme = gradeSeme;
	}
	public String getChkPeriod() {
		return chkPeriod;
	}
	public void setChkPeriod(String chkPeriod) {
		this.chkPeriod = chkPeriod;
	}
	
	public int getAppCred() {
		return appCred;
	}
	public void setAppCred(int appCred) {
		this.appCred = appCred;
	}
	public int getReceivedCred() {
		return receivedCred;
	}
	public void setReceivedCred(int receivedCred) {
		this.receivedCred = receivedCred;
	}
	
	
	
}
