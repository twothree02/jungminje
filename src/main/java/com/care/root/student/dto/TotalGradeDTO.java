package com.care.root.student.dto;

public class TotalGradeDTO {
	private int tApplicationCred;
	private int tReceivedCred;
	private String tAvgGrade;
	private String tScore;
	
	public int gettApplicationCred() {
		return tApplicationCred;
	}
	public void settApplicationCred(int tApplicationCred) {
		this.tApplicationCred = tApplicationCred;
	}
	public int gettReceivedCred() {
		return tReceivedCred;
	}
	public void settReceivedCred(int tReceivedCred) {
		this.tReceivedCred = tReceivedCred;
	}
	public String gettAvgGrade() {
		return tAvgGrade;
	}
	public void settAvgGrade(String tAvgGrade) {
		this.tAvgGrade = tAvgGrade;
	}
	public String gettScore() {
		return tScore;
	}
	public void settScore(String tScore) {
		this.tScore = tScore;
	}
	
	
}
