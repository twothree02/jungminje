package com.care.root.board.noticedto;

import java.sql.Date;

public class noticeDTO {
	private Integer writeNo;
	private String title;
	private String content;
	private Date savedate;
	private int hit;
	private String name;
	private String fileupload;

	public Integer getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(Integer writeNo) {
		this.writeNo = writeNo;
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

	public Date getSavedate() {
		return savedate;
	}

	public void setSavedate(Date savedate) {
		this.savedate = savedate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getFileupload() {
		return fileupload;
	}

	public void setFileupload(String fileupload) {
		this.fileupload = fileupload;
	}

}
