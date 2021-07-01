package com.care.root.board.portaldto;

public class portalPageDTO {
	private int startPage, endPage;
	private boolean prev, next;
	
	private int total;
	private viewNumber2 vN;
	
	public portalPageDTO(viewNumber2 vN, int total) {
		this.vN = vN;
		this.total = total;
		
		this.endPage = (int)(Math.ceil( vN.getPageNum()/10.0)) *10;
		this.startPage = endPage -9;
		this.prev = this.startPage >1 ;
		int realEnd =(int) (Math.ceil( (total*1.0) /vN.getAmount()) );
		this.endPage = realEnd <= endPage ? realEnd :endPage;
		
		this.next = this.endPage < realEnd;
	
	}

	

	public int getStartPage() {
		return startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public boolean isPrev() {
		return prev;
	}



	public boolean isNext() {
		return next;
	}



	public int getTotal() {
		return total;
	}



	public viewNumber2 getvN() {
		return vN;
	}



	@Override
	public String toString() {
		return "pageDTO2 [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", vN=" + vN + "]";
	}

}
