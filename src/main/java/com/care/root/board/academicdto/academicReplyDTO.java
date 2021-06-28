package com.care.root.board.academicdto;

public class academicReplyDTO {
	private String id; // 댓글 아이디
	private String title; // 댓글 제목
	private String content; // 댓글 내용
	private int step;// 댓글이 증가할 때마다 +1
	private java.util.Date write_date; // 댓글에 대한 시간
	private int rno;// 댓글 번호

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	
	public java.util.Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(java.util.Date write_date) {
		this.write_date = write_date;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

}
