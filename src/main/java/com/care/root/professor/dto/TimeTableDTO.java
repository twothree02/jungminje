package com.care.root.professor.dto;

public class TimeTableDTO {

	private String yearSeme;
	private String idNum;
	private String major;
	private String subject;
	private String professor;
	private String lectureRoom;
	private String time;
	
	public String getYearSeme() {
		return yearSeme;
	}
	public void setYearSeme(String yearSeme) {
		this.yearSeme = yearSeme;
	}
	public String getIdNum() {
		return idNum;
	}
	public void setIdNum(String idNum) {
		this.idNum = idNum;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getProfessor() {
		return professor;
	}
	public void setProfessor(String professor) {
		this.professor = professor;
	}
	public String getLectureRoom() {
		return lectureRoom;
	}
	public void setLectureRoom(String lectureRoom) {
		this.lectureRoom = lectureRoom;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
	
}
