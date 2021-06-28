package com.care.root.student.dto;

public class SemesterGradeDTO {
	private int applicationCred;
	private int receivedCred;
	private String avgGrade;
	private int rank;
	public int getApplicationCred() {
		return applicationCred;
	}
	public void setApplicationCred(int applicationCred) {
		this.applicationCred = applicationCred;
	}
	public int getReceivedCred() {
		return receivedCred;
	}
	public void setReceivedCred(int receivedCred) {
		this.receivedCred = receivedCred;
	}
	public String getAvgGrade() {
		return avgGrade;
	}
	public void setAvgGrade(String avgGrade) {
		this.avgGrade = avgGrade;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	
}
