package com.care.root.student.dto;

import java.sql.Date;

public class TuitionInfoDTO {
	private String grade101;
	private String grade102;
	private String grade201;
	private String grade202;
	private String paymentStu;
	private String payment;
	private Date regStart;
	private Date regEnd;
	
	public String getGrade101() {
		return grade101;
	}
	public void setGrade101(String grade101) {
		this.grade101 = grade101;
	}
	public String getGrade102() {
		return grade102;
	}
	public void setGrade102(String grade102) {
		this.grade102 = grade102;
	}
	public String getGrade201() {
		return grade201;
	}
	public void setGrade201(String grade201) {
		this.grade201 = grade201;
	}
	public String getGrade202() {
		return grade202;
	}
	public void setGrade202(String grade202) {
		this.grade202 = grade202;
	}
	public String getPaymentStu() {
		return paymentStu;
	}
	public void setPaymentStu(String paymentStu) {
		this.paymentStu = paymentStu;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Date getRegStart() {
		return regStart;
	}
	public void setRegStart(Date regStart) {
		this.regStart = regStart;
	}
	public Date getRegEnd() {
		return regEnd;
	}
	public void setRegEnd(Date regEnd) {
		this.regEnd = regEnd;
	}
}
