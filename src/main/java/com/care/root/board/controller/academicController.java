package com.care.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.academicdto.academicPageDTO;
import com.care.root.board.academicdto.viewNumber3;
import com.care.root.board.portaldto.portalPageDTO;
import com.care.root.board.portaldto.viewNumber2;
import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.boardService;
import com.care.root.common.session.MemberSessionName;

@Controller
@RequestMapping("board")
public class academicController implements MemberSessionName {
	
	@Autowired
	private boardService service;
	
	@RequestMapping("academicList")
	public String academiclist(Model model, viewNumber3 view) {
		model.addAttribute("list", service.academicList(view));
		model.addAttribute("boardPage",new academicPageDTO(view, service.academictotal(view)));
		return "academicBoard/academicList";
	}
	@GetMapping("academicRegister")
	public String portalregister () {
		return "academicBoard/academicRegister";
	}

	@PostMapping("academicRegister")
	public void academicRegister(MultipartHttpServletRequest mul,HttpServletResponse response ,HttpServletRequest rquest) throws Exception {
		String message = service.academicRegister(mul, rquest);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html chartest=utf-8");
		out.print(message);
	}
	@GetMapping("academicContentView")
		public String academicContentView(@RequestParam("writeNo") int writeNo, Model model ) {
		service.academicContentView(writeNo, model);
		return "academicBoard/academicContentView";
		}
	
	@GetMapping("academicDownload")
	public void academicDownload(@RequestParam String fileupload,
						HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition","attachment;imageFileName="+fileupload);
		File file = new File(BoardFileService.IMAGE_REPO+"/"+fileupload);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	@GetMapping("academicModify")
	public String academicModify(@RequestParam("writeNo")int writeNo, Model model) {
		service.academicContentView(writeNo,model);
		return "academicBoard/academicModify";
	}
	@PostMapping("academicModify")
	public void academicModify(MultipartHttpServletRequest mul,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		String message = service.academicModify(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	@GetMapping("academicDelete")
	public void academicDelete(@RequestParam int writeNo,
						@RequestParam String fileupload,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		String message = service.academicDelete(writeNo, fileupload, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}

	
}

















