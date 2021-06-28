package com.care.root.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.academicdto.academicReplyDTO;
import com.care.root.board.academicdto.viewNumber3;
import com.care.root.board.noticedto.noticeDTO;
import com.care.root.board.noticedto.noticeReplyDTO;
import com.care.root.board.noticedto.viewNumber;
import com.care.root.board.portaldto.portalDTO;
import com.care.root.board.portaldto.portalReplyDTO;
import com.care.root.board.portaldto.viewNumber2;

public interface boardService {

	//notice 영역
	List<noticeDTO>getList();
	public String register(MultipartHttpServletRequest mul,HttpServletRequest request);
	public String modify(MultipartHttpServletRequest mul,HttpServletRequest request); 
	public void contentView(int writeNo,Model model);
	public String delete(int writeNo, String fileupload, HttpServletRequest request);
	List<noticeDTO>getList(viewNumber vN);
	int total(viewNumber vN);
	public void hit(int writeNo);

	

	//notice 댓글

	// 댓글 목록 조회
	public List<noticeReplyDTO> replyList(noticeReplyDTO comment) ;
	// 댓글 입력
	public void addReply(noticeReplyDTO dto);
	
	//댓글삭제
	public List<noticeReplyDTO> replyDelete(noticeReplyDTO comment);
	
	//댓글 수정 눌렀을 때 이전 댓글 불러오기
	public noticeReplyDTO replyModView(noticeReplyDTO comment) ;
	
	//수정
	public List<noticeReplyDTO> replyModify(noticeReplyDTO comment) ;
	
	//댓글페이징
	public Map<String, Object> replyPaging(int num,noticeReplyDTO dto);

	//메인

	List<noticeDTO>mainList();



	//portal 영역
	List<portalDTO>portalList();
	public String portalRegister(MultipartHttpServletRequest mul,HttpServletRequest request);
	public String portalModify(MultipartHttpServletRequest mul,HttpServletRequest request); 
	public void portalContentView(int writeNo,Model model);
	public String portalDelete(int writeNo, String fileupload, HttpServletRequest request);
	List<portalDTO>portalList(viewNumber2 view);
	public void portalHit(int writeNo);

	int portaltotal(viewNumber2 view);

	
	//portal 댓글

		// 댓글 목록 조회
		public List<portalReplyDTO> portalReplyList(portalReplyDTO comment) ;
		// 댓글 입력
		public void portalAddReply(portalReplyDTO dto);
		
		//댓글삭제
		public List<portalReplyDTO> portalReplyDelete(portalReplyDTO comment);
		
		//댓글 수정 눌렀을 때 이전 댓글 불러오기
		public portalReplyDTO portalReplyModView(portalReplyDTO comment) ;
		
		//수정
		public List<portalReplyDTO> portalReplyModify(portalReplyDTO comment) ;
		
		//댓글페이징
		public Map<String, Object> portalReplyPaging(Model model, int num,portalReplyDTO dto);

		//메인

		List<portalDTO>portalMainList();
		
		List<portalDTO>academicList();
		public String academicRegister(MultipartHttpServletRequest mul,HttpServletRequest request);
		public String academicModify(MultipartHttpServletRequest mul,HttpServletRequest request); 
		public void academicContentView(int writeNo,Model model);
		public String academicDelete(int writeNo, String fileupload, HttpServletRequest request);
		List<portalDTO>academicList(viewNumber3 view);
		public void academicHit(int writeNo);

		int academictotal(viewNumber3 view);
		
		
		// 댓글 목록 조회
		public List<academicReplyDTO> academicReplyList(academicReplyDTO comment) ;
		// 댓글 입력
		public void academicAddReply(academicReplyDTO dto);
		
		//댓글삭제
		public List<academicReplyDTO> academicReplyDelete(academicReplyDTO comment);
		
		//댓글 수정 눌렀을 때 이전 댓글 불러오기
		public academicReplyDTO academicReplyModView(academicReplyDTO comment) ;
		
		//수정
		public List<academicReplyDTO> academicReplyModify(academicReplyDTO comment) ;
		
		//댓글페이징
		public Map<String, Object> academicReplyPaging(Model model, int num,academicReplyDTO dto);

		//메인

		List<academicReplyDTO>academicMainList();
}
