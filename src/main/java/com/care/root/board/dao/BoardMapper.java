package com.care.root.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.care.root.board.academicdto.academicDTO;
import com.care.root.board.academicdto.academicReplyDTO;
import com.care.root.board.academicdto.viewNumber3;
import com.care.root.board.noticedto.noticeDTO;
import com.care.root.board.noticedto.noticeReplyDTO;
import com.care.root.board.noticedto.viewNumber;
import com.care.root.board.portaldto.portalDTO;
import com.care.root.board.portaldto.portalReplyDTO;
import com.care.root.board.portaldto.viewNumber2;

public interface BoardMapper {
	// notice board 영역
	List<noticeDTO>getList();
	List<noticeDTO>getPaging(viewNumber vN);
	public int register(noticeDTO dto);
	public noticeDTO contentView(int writeNo );
	public void hit(int writeNo);
	public int modify(noticeDTO dto);
	public int delete(int writeNo);
	int total(viewNumber vN);
	
	
	//notice reply 영역
	public List<noticeReplyDTO> replyList(int rno);
	//댓글 입력
	public void addReply(noticeReplyDTO dto);
	//댓글 삭제
	public int replyDelete(int step);
	//댓글 수정 눌렀을 때 이전 댓글 불러오기
	public noticeReplyDTO replyModView(int step);
	//수정
	public int replyModify(noticeReplyDTO comment); 
	//댓글 페이징
	public ArrayList<noticeReplyDTO> replyPaging(@Param("s") int start, @Param("e") int end,@Param("rno")int rno);
	//댓글 총 개수
	public int replycount(int rno);
	//메인리스트
	List<noticeDTO>mainList();
	

	//portal 영역
	List<portalDTO>portalList();
	List<portalDTO>portalPaging(viewNumber2 view);
	public int portalRegister(portalDTO dto);
	public portalDTO portalContentView(int writeNo );
	public void portalHit(int writeNo);
	public int portalModify(portalDTO dto);
	public int portalDelete(int writeNo);
	int portaltotal(viewNumber2 view);


	//portal 댓글
	public List<portalReplyDTO> portalReplyList(int rno);
	//댓글 입력
	public void portalAddReply(portalReplyDTO dto);
	//댓글 삭제
	public int portalReplyDelete(int step);
	//댓글 수정 눌렀을 때 이전 댓글 불러오기
	public portalReplyDTO portalReplyModView(int step);	//수정
	public int portalReplyModify(portalReplyDTO comment); 
	//댓글 페이징
	public ArrayList<portalReplyDTO> portalReplyPaging(@Param("s") int start, @Param("e") int end,@Param("rno")int rno);
	//댓글 총 개수
	public int  portalReplycount (int rno);
	//메인리스트
	List<portalDTO>portalMainList();
	
	
	//academic 영역
	List<portalDTO>academicList();
	List<portalDTO>academicPaging(viewNumber3 view);
	public int academicRegister(academicDTO dto);
	public academicDTO academicContentView(int writeNo );
	public void academicHit(int writeNo);
	public int academicModify(academicDTO dto);
	public int academicDelete(int writeNo);
	int academictotal(viewNumber3 view);
	
	
	
	
	//academic 댓글
		public List<academicReplyDTO> academicReplyList(int rno);
		//댓글 입력
		public void academicAddReply(academicReplyDTO dto);
		//댓글 삭제
		public int academicReplyDelete(int step);
		//댓글 수정 눌렀을 때 이전 댓글 불러오기
		public academicReplyDTO academicReplyModView(int step);	//수정
		public int academicReplyModify(academicReplyDTO comment); 
		//댓글 페이징
		public ArrayList<academicReplyDTO> academicReplyPaging(@Param("s") int start, @Param("e") int end,@Param("rno")int rno);
		//댓글 총 개수
		public int  academicReplycount (int rno);
		//메인리스트
		List<academicReplyDTO>academicMainList();
		
}















