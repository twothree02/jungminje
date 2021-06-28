package com.care.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.noticedto.noticePageDTO;
import com.care.root.board.noticedto.viewNumber;
import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.boardService;
import com.care.root.common.session.MemberSessionName;
import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;



@Controller
@RequestMapping("board")
public class noticeController implements MemberSessionName {
	@Autowired
	private boardService service;

	@RequestMapping("adminMain")
	public String aadminMain() {
		return "admin/adminMain";
	}

	@RequestMapping("professorMain")
	public String professorMain() {
		return "professor/professorMain";
	}

	@RequestMapping("list")
	public String list(Model model, viewNumber vN) {
		model.addAttribute("list", service.getList(vN));
		model.addAttribute("boardPage",new noticePageDTO(vN, service.total(vN)));
		return "noticsBoard/list";
	}
	@GetMapping("register")
	public String register () {
		return "noticsBoard/register";
	}

	@PostMapping("register")
	public void register(MultipartHttpServletRequest mul,HttpServletResponse response ,HttpServletRequest rquest) throws Exception {
		String message = service.register(mul, rquest);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html chartest=utf-8");
		out.print(message);
	}
	@GetMapping("contentView")
		public String contentView(@RequestParam("writeNo") int writeNo, Model model ) {
		service.contentView(writeNo, model);
		return "noticsBoard/contentView";
		}
	
	@GetMapping("download")
	public void download(@RequestParam String fileupload,
						HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition","attachment;imageFileName="+fileupload);
		File file = new File(BoardFileService.IMAGE_REPO+"/"+fileupload);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	@GetMapping("modify")
	public String modify(@RequestParam("writeNo")int writeNo, Model model) {
		service.contentView(writeNo,model);
		return "noticsBoard/modify";
	}
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		String message = service.modify(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	@GetMapping("delete")
	public void delete(@RequestParam int writeNo,
						@RequestParam String fileupload,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		String message = service.delete(writeNo, fileupload, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	
	
	@RequestMapping("main")
	public String mainList(Model model) {
		model.addAttribute("list",service.mainList());
		model.addAttribute("portalMainList",service.portalMainList());
		model.addAttribute("academicMainList",service.academicMainList());
		return "main";
	}
	

	//portal 영역
	

}
