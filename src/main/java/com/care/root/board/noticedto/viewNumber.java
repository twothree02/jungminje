package com.care.root.board.noticedto;

public class viewNumber {
	private int pageNum;
	private int amount;
	
	private String keyword;
	private String type;

	public viewNumber() {
		this(1, 10);
	}

	public viewNumber(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "viewNumber [pageNum=" + pageNum + ", amount=" + amount + ", keyword=" + keyword + ", type=" + type
				+ "]";
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
}
