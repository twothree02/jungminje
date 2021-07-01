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

import com.care.root.board.noticedto.noticeReplyDTO;
import com.care.root.board.portaldto.portalReplyDTO;
import com.care.root.board.service.boardService;
import com.care.root.common.session.MemberSessionName;

@RestController
@RequestMapping("board")
public class portalReplyController implements MemberSessionName {
	@Autowired
	boardService service;

	List<portalReplyDTO> portalList = new ArrayList<portalReplyDTO>();

	
	//댓글 목록 및 페이지
	@RequestMapping(value = "portalList", produces = "application/json; charset=utf-8")
	public @ResponseBody Map<String, Object> portalList(@ModelAttribute portalReplyDTO comment ,Model model, @RequestParam(value="num",required = false, defaultValue = "1")int num){
		//service.replyPaging(model, num);// 넘값이랑 모델로 해서 뿌려주기
		Map<String, Object> co =  service.portalReplyPaging(model,num, comment);
		co.put("commentList", service.portalReplyList(comment));//모든값을 담아준다
		System.out.println("리스트 컨트롤러 실행");
		
		
		System.out.println(num);
		return co;
	}

	
	
	
	
	// 댓글 입력
	@PostMapping(value = "portalReply" , produces = "application/json; charset=utf-8")
	public String addReply(@RequestBody Map<String, Object> map, HttpSession session) {
		portalReplyDTO dto = new portalReplyDTO();
		dto.setId((String)session.getAttribute(LOGIN));
		dto.setRno(Integer.parseInt( (String)map.get("writeNo")));
	
		dto.setContent((String)map.get("content"));
		System.out.println("컨트롤러 실행 합니다");
		System.out.println(map);
		service.portalAddReply(dto);
		return "{\"result\":\"success\"}";

	}
	//댓글 수정시 보여지는 창
	@RequestMapping(value = "portalModView" , produces = "application/json; charset=utf-8")
	public @ResponseBody portalReplyDTO commentModiView(@ModelAttribute portalReplyDTO comment) {
		portalReplyDTO commentView = service.portalReplyModView(comment);
		System.out.println("컨트롤러실행합니다");
		System.out.println(comment);
		System.out.println(commentView);
		return commentView;
	}
	//댓글 수정
	 @RequestMapping(value="portalModify" , produces = "application/json; charset=utf-8") 
	  public @ResponseBody List<portalReplyDTO> replyModify(@ModelAttribute portalReplyDTO comment) {
		  System.out.println("확인");
		  System.out.println(comment);
		  portalList=service.portalReplyModify(comment); 
		  System.out.println("commentList: "+ portalList);
		  return portalList; 
	  }
	 //댓글 삭제
	 @RequestMapping(value = "portalDelete" , produces = "application/json; charset=utf-8")
		public @ResponseBody List<portalReplyDTO> commentDelete(@ModelAttribute portalReplyDTO comment) {
			portalList = service.portalReplyDelete(comment);
			System.out.println("컨트롤러실행");
			System.out.println(comment.getStep());
			return portalList;
		}
}
