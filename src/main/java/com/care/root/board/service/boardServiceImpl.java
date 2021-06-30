package com.care.root.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.academicdto.academicDTO;
import com.care.root.board.academicdto.academicMessageDTO;
import com.care.root.board.academicdto.academicReplyDTO;
import com.care.root.board.academicdto.viewNumber3;
import com.care.root.board.dao.BoardMapper;
import com.care.root.board.noticedto.noticeDTO;
import com.care.root.board.noticedto.noticeMessageDTO;
import com.care.root.board.noticedto.noticeReplyDTO;
import com.care.root.board.noticedto.viewNumber;
import com.care.root.board.portaldto.portalDTO;
import com.care.root.board.portaldto.portalMessageDTO;
import com.care.root.board.portaldto.portalReplyDTO;
import com.care.root.board.portaldto.viewNumber2;

@Service
public class boardServiceImpl implements boardService {
	
	
	@Autowired
	BoardMapper mapper;


	//댓글 수정할 리스트
	List<noticeReplyDTO> commentList = new ArrayList<noticeReplyDTO>();
	List<portalReplyDTO> portalList = new ArrayList<portalReplyDTO>();
	List<academicReplyDTO> academicList = new ArrayList<academicReplyDTO>();


	@Override
	public List<noticeDTO> getList() {
		return mapper.getList();
	}


	@Override
	public String register(MultipartHttpServletRequest mul, HttpServletRequest request) {
		noticeDTO dto = new noticeDTO();
	
		dto.setContent(mul.getParameter("content"));
		dto.setTitle(mul.getParameter("title"));
		dto.setName(mul.getParameter("name"));
		HttpSession session = request.getSession();
		BoardFileService bfs = new BoardFileServiceImpl();
		MultipartFile file = mul.getFile("fileupload");
		if(file.getSize() != 0) {
			dto.setFileupload(bfs.saveFile(file));
		}else {
			dto.setFileupload("nan");
		}
		return bfs.getMessage(mapper.register(dto),request);
	}


	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		noticeDTO dto = new noticeDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));

		MultipartFile file = mul.getFile("fileupload");
		BoardFileService bfs = new BoardFileServiceImpl();
		if(file.getSize() != 0) {
			dto.setFileupload(bfs.saveFile(file));
			bfs.deletefile(mul.getParameter("originFileName"));
		}else {
			dto.setFileupload(mul.getParameter("originFileName"));
		}
		int result = mapper.modify(dto);
		noticeMessageDTO mDTO = new noticeMessageDTO();
		mDTO.setResult(result);
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 수정되었습니다");
		mDTO.setSuccessURL("/board/list");
		mDTO.setFailMessage("수정 중 문제가 발생하였습니다");
		mDTO.setFailURL("/board/modify");
		String message = bfs.getMessage(mDTO);
		return message;
	}


	@Override
	public void contentView(int writeNo, Model model) {
		mapper.hit(writeNo);
		model.addAttribute("board",mapper.contentView(writeNo));
	}
	

	@Override
	public String delete(int writeNo, String fileupload, HttpServletRequest request) {
		BoardFileService bfs = new BoardFileServiceImpl();
		int result = mapper.delete(writeNo);
		
		if(result == 1) {
			bfs.deletefile(fileupload);
		}
		noticeMessageDTO mDTO = new noticeMessageDTO();
		mDTO.setResult(result);
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 삭제 되었습니다");
		mDTO.setSuccessURL("/board/list");
		mDTO.setFailMessage("삭제 중 문제가 발생하였습니다");
		mDTO.setFailURL("/board/contentView");
		return bfs.getMessage(mDTO);
	}

	@Override
	public List<noticeDTO> getList(viewNumber vN) {
		return mapper.getPaging(vN);
	}

	@Override
	public int total(viewNumber vN) {
		return mapper.total(vN);
		}


	@Override
	public List<noticeReplyDTO> replyList(noticeReplyDTO comment) {
		commentList = mapper.replyPaging(1, 5, comment.getRno());
		return commentList;
	}


	@Override
	public void addReply(noticeReplyDTO dto) {
		mapper.addReply(dto);
		}



	@Override
	public List<noticeReplyDTO> replyDelete(noticeReplyDTO comment) {
		int delResult = mapper.replyDelete(comment.getStep());
		if (delResult > 0) {
			commentList = mapper.replyList(comment.getStep());
		} else {
			commentList = null;
		}
		System.out.println("서비스 실행");
		return commentList;
	}

	@Override
	public noticeReplyDTO replyModView(noticeReplyDTO comment) {
		noticeReplyDTO commentView = mapper.replyModView(comment.getStep());
		return commentView;
	}

	@Override
	public List<noticeReplyDTO> replyModify(noticeReplyDTO comment) {
		int commenModify = mapper.replyModify(comment);

		if (commenModify > 0) {
			commentList = mapper.replyList(comment.getRno());
		} else {
			commentList = null;
		}
		return commentList;
	}


	@Override
	public Map<String, Object> replyPaging(int num, noticeReplyDTO dto) {
		int pageLetter = 5;//한 페이지 5개의 글 
		int allCount = mapper.replycount(dto.getRno());//총 글 개수 얻어오기 
		
		int repeat = allCount / pageLetter;   
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end+1 - pageLetter;
		Map<String, Object> paging = new HashMap<>();
		paging.put("paging", mapper.replyPaging(start, end,dto.getRno()));
		paging.put("repeat", repeat);
	
		
		
		System.out.println("페이징서비스 실행");
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		System.out.println("rno:"+dto.getRno());
		System.out.println("step:"+dto.getStep());
		
		return paging;
	
	}



	//portal 영역
	@Override
	public List<portalDTO> portalList() {
		return mapper.portalList();
		}

	@Override
	public String portalRegister(MultipartHttpServletRequest mul, HttpServletRequest request) {
		portalDTO dto = new portalDTO();
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		dto.setName(mul.getParameter("name"));
		
		HttpSession session = request.getSession();
		
		portalFileBoardService bfs = new portalFileBoardServiceImpl();
		
		MultipartFile file = mul.getFile("fileupload");
		
		if(file.getSize() != 0) {
			dto.setFileupload(bfs.portalSaveFile(file));
		}else {
			dto.setFileupload("nan");
		}
		return bfs.portalMessage(mapper.portalRegister(dto),request);
	}


	@Override
	public String portalModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		portalDTO dto = new portalDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));

		MultipartFile file = mul.getFile("fileupload");
		portalFileBoardService bfs = new portalFileBoardServiceImpl();
		if(file.getSize() != 0) {
			dto.setFileupload(bfs.portalSaveFile(file));
			bfs.portalDeletefile(mul.getParameter("originFileName"));
		}else {
			dto.setFileupload(mul.getParameter("originFileName"));
		}
		int result = mapper.portalModify(dto);
		portalMessageDTO mDTO = new portalMessageDTO();
		mDTO.setResult(result);
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 수정되었습니다");
		mDTO.setSuccessURL("/board/portalList");
		mDTO.setFailMessage("수정 중 문제가 발생하였습니다");
		mDTO.setFailURL("/board/portalModify");
		String message = bfs.portalGetMessage(mDTO);
		return message;
	}



	@Override
	public void portalContentView(int writeNo, Model model) {
		mapper.portalHit(writeNo);
		model.addAttribute("board",mapper.portalContentView(writeNo));
		

		
	}
	

	@Override
	public String portalDelete(int writeNo, String fileupload, HttpServletRequest request) {
		portalFileBoardService bfs = new portalFileBoardServiceImpl();
		int result = mapper.portalDelete(writeNo);
		
		if(result == 1) {
			bfs.portalDeletefile(fileupload);
		}
		portalMessageDTO mDTO = new portalMessageDTO();
		mDTO.setResult(result);
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 삭제 되었습니다");
		mDTO.setSuccessURL("/board/portalList");
		mDTO.setFailMessage("삭제 중 문제가 발생하였습니다");
		mDTO.setFailURL("/board/portalContentView");
		return bfs.portalGetMessage(mDTO);
	}

	@Override
	public List<portalDTO> portalList(viewNumber2 view) {
		return mapper.portalPaging(view);
		}



	@Override
	public int portaltotal(viewNumber2 view) {
		return mapper.portaltotal(view);
		}


	
	
	
	//댓글영역
	@Override
	public List<portalReplyDTO> portalReplyList(portalReplyDTO comment) {
		portalList = mapper.portalReplyPaging(1, 5, comment.getRno());
		return portalList;
	}


	@Override
	public void portalAddReply(portalReplyDTO dto) {
		mapper.portalAddReply(dto);
	}



	@Override
	public List<portalReplyDTO> portalReplyDelete(portalReplyDTO comment) {
		int delResult = mapper.portalReplyDelete(comment.getStep());
		if (delResult > 0) {
			portalList = mapper.portalReplyList(comment.getStep());
		} else {
			portalList = null;
		}
		System.out.println("서비스 실행");
		return portalList;
	}


	@Override
	public portalReplyDTO portalReplyModView(portalReplyDTO comment) {
		portalReplyDTO commentView = mapper.portalReplyModView(comment.getStep());
		return commentView;
	}


	@Override
	public List<portalReplyDTO> portalReplyModify(portalReplyDTO comment) {
		int commenModify = mapper.portalReplyModify(comment);

		if (commenModify > 0) {
			portalList = mapper.portalReplyList(comment.getRno());
		} else {
			portalList = null;
		}
		return portalList;
	}

	@Override
	public Map<String, Object> portalReplyPaging(Model model, int num, portalReplyDTO dto) {
		int pageLetter = 5;//한 페이지 10개의 글
		int allCount = mapper.portalReplycount(dto.getRno());//총 글 개수 얻어오기
		
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end+1 - pageLetter;
		Map<String, Object> paging = new HashMap<>();
		paging.put("paging", mapper.portalReplyPaging(start, end,dto.getRno()));
		paging.put("repeat", repeat);
		System.out.println("페이징서비스 실행");
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		System.out.println("rno:"+dto.getRno());
		
		return paging;
	
	}

	

	@Override
	public void hit(int writeNo) {
		mapper.hit(writeNo);
	}


	@Override
	public void portalHit(int writeNo) {
		mapper.portalHit(writeNo);
		
	}

	//academic 영역
	@Override
	public List<portalDTO> academicList() {
		return mapper.academicList();
	}


	@Override
	public String academicRegister(MultipartHttpServletRequest mul, HttpServletRequest request) {
		academicDTO dto = new academicDTO();

		dto.setContent(mul.getParameter("content"));
		dto.setTitle(mul.getParameter("title"));
		dto.setName(mul.getParameter("name"));
		HttpSession session = request.getSession();
		academicFileBoardService bfs = new academicFileBoardServiceImpl();
		MultipartFile file = mul.getFile("fileupload");
		
		if(file.getSize() != 0) {
			dto.setFileupload(bfs.academicSaveFile(file));
		}else {
			dto.setFileupload("nan");
		}
		return bfs.academicMessage(mapper.academicRegister(dto),request);
	}


	@Override
	public String academicModify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		academicDTO dto = new academicDTO();
		dto.setWriteNo(Integer.parseInt(mul.getParameter("writeNo")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));

		MultipartFile file = mul.getFile("fileupload");
	
		academicFileBoardService bfs = new academicFileBoardServiceImpl();
		if(file.getSize() != 0) {
			dto.setFileupload(bfs.academicSaveFile(file));
			bfs.academicDeletefile(mul.getParameter("originFileName"));
		}else {
			dto.setFileupload(mul.getParameter("originFileName"));
		}
		int result = mapper.academicModify(dto);
		academicMessageDTO mDTO = new academicMessageDTO();
		mDTO.setResult(result);
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 수정되었습니다");
		mDTO.setSuccessURL("/board/academicList");
		mDTO.setFailMessage("수정 중 문제가 발생하였습니다");
		mDTO.setFailURL("/board/academicModify");
		String message = bfs.academicGetMessage(mDTO);
		return message;
	}



	@Override
	public void academicContentView(int writeNo, Model model) {
		mapper.academicHit(writeNo);
		model.addAttribute("board",mapper.academicContentView(writeNo));
		
	}


	@Override
	public String academicDelete(int writeNo, String fileupload, HttpServletRequest request) {
		academicFileBoardService bfs = new academicFileBoardServiceImpl();
		int result = mapper.academicDelete(writeNo);
		
		if(result == 1) {
			bfs.academicDeletefile(fileupload);
		}
		academicMessageDTO mDTO = new academicMessageDTO();
		mDTO.setResult(result);
		mDTO.setRequest(request);
		mDTO.setSuccessMessage("성공적으로 삭제 되었습니다");
		mDTO.setSuccessURL("/board/academicList");
		mDTO.setFailMessage("삭제 중 문제가 발생하였습니다");
		mDTO.setFailURL("/board/academicContentView");
		return bfs.academicGetMessage(mDTO);
	}



	@Override
	public List<portalDTO> academicList(viewNumber3 view) {
		return mapper.academicPaging(view);
	}


	@Override
	public void academicHit(int writeNo) {
		mapper.academicHit(writeNo);
	}


	@Override
	public int academictotal(viewNumber3 view) {
		return mapper.academictotal(view);
	}


	@Override
	public List<academicReplyDTO> academicReplyList(academicReplyDTO comment) {
		academicList = mapper.academicReplyPaging(1, 5, comment.getRno());
		return academicList;
	}


	@Override
	public void academicAddReply(academicReplyDTO dto) {
		mapper.academicAddReply(dto);
		}



	@Override
	public List<academicReplyDTO> academicReplyDelete(academicReplyDTO comment) {
		int delResult = mapper.academicReplyDelete(comment.getStep());
		if (delResult > 0) {
			academicList = mapper.academicReplyList(comment.getStep());
		} else {
			academicList = null;
		}
		System.out.println("서비스 실행");
		return academicList;
	}



	@Override
	public academicReplyDTO academicReplyModView(academicReplyDTO comment) {
		academicReplyDTO commentView = mapper.academicReplyModView(comment.getStep());
		return commentView;
	}


	@Override
	public List<academicReplyDTO> academicReplyModify(academicReplyDTO comment) {
		int commenModify = mapper.academicReplyModify(comment);

		if (commenModify > 0) {
			academicList = mapper.academicReplyList(comment.getRno());
		} else {
			academicList = null;
		}
		return academicList;
	}


	@Override
	public Map<String, Object> academicReplyPaging(Model model, int num, academicReplyDTO dto) {
		int pageLetter = 5;//한 페이지 10개의 글
		int allCount = mapper.academicReplycount(dto.getRno());//총 글 개수 얻어오기
		
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end+1 - pageLetter;
		Map<String, Object> paging = new HashMap<>();
		paging.put("paging", mapper.academicReplyPaging(start, end,dto.getRno()));
		paging.put("repeat", repeat);
		System.out.println("페이징서비스 실행");
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		System.out.println("rno:"+dto.getRno());
		
		return paging;
	
	}





	

	

	

	
	}

	

	



	
	
	
	

	

	


