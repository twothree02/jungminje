package com.care.root.board.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.board.academicdto.academicPageDTO;
import com.care.root.board.academicdto.academicReplyDTO;
import com.care.root.board.noticedto.noticeReplyDTO;
import com.care.root.board.portaldto.portalReplyDTO;
import com.care.root.board.service.boardService;
import com.care.root.common.session.MemberSessionName;

@RestController
@RequestMapping("board")
public class academicReplyController implements MemberSessionName {
	@Autowired
	boardService service;

	List<academicReplyDTO> academicList = new ArrayList<academicReplyDTO>();

	
	//댓글 목록 및 페이지
	@RequestMapping(value = "academicList", produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> academicList(@ModelAttribute academicReplyDTO comment ,Model model, @RequestParam(value="num",required = false, defaultValue = "1")int num){
		//service.replyPaging(model, num);// 넘값이랑 모델로 해서 뿌려주기
		Map<String, Object> co =  service.academicReplyPaging(model,num, comment);
		co.put("commentList", service.academicReplyList(comment));//모든값을 담아준다
		System.out.println("리스트 컨트롤러 실행");
		
		
		System.out.println(num);
		return co;
	}

	
	
	
	
	// 댓글 입력
	@PostMapping(value = "academicReply" , produces = "application/json; charset=utf-8")
	public String academicAddReply(@RequestBody Map<String, Object> map, HttpSession session) {
		academicReplyDTO dto = new academicReplyDTO();
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setRno(Integer.parseInt( (String)map.get("writeNo")));
		dto.setTitle((String)map.get("title"));
		dto.setContent((String)map.get("content"));
		System.out.println("컨트롤러 실행 합니다");
		System.out.println(map);
		service.academicAddReply(dto);
		return "{\"result\":\"success\"}";

	}
	//댓글 수정시 보여지는 창
	@RequestMapping(value = "academicModView" , produces = "application/json; charset=utf-8")
	public @ResponseBody academicReplyDTO commentModiView(@ModelAttribute academicReplyDTO comment) {
		academicReplyDTO commentView = service.academicReplyModView(comment);
		System.out.println("컨트롤러실행합니다");
		System.out.println(comment);
		System.out.println(commentView);
		return commentView;
	}
	//댓글 수정
	 @RequestMapping(value="academicModify" , produces = "application/json; charset=utf-8") 
	  public @ResponseBody List<academicReplyDTO> replyModify(@ModelAttribute academicReplyDTO comment) {
		  System.out.println("확인");
		  System.out.println(comment);
		  academicList=service.academicReplyModify(comment); 
		  System.out.println("commentList: "+ academicList);
		  return academicList; 
	  }
	 //댓글 삭제
	 @RequestMapping(value = "academicDelete" , produces = "application/json; charset=utf-8")
		public @ResponseBody List<academicReplyDTO> commentDelete(@ModelAttribute academicReplyDTO comment) {
			academicList = service.academicReplyDelete(comment);
			System.out.println("컨트롤러실행");
			System.out.println(comment.getStep());
			return academicList;
		}
}
