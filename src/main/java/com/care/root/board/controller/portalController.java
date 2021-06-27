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

import com.care.root.board.portaldto.portalPageDTO;
import com.care.root.board.portaldto.viewNumber2;
import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.boardService;
import com.care.root.common.session.MemberSessionName;

@Controller
public class portalController implements MemberSessionName {
	
	@Autowired
	private boardService service;
	
	@RequestMapping("portalList")
	public String portallist(Model model, viewNumber2 view) {
		model.addAttribute("list", service.portalList(view));
		model.addAttribute("boardPage",new portalPageDTO(view, service.portaltotal(view)));
		return "portalBoard/portalList";
	}
	@GetMapping("portalRegister")
	public String portalregister () {
		return "portalBoard/portalRegister";
	}

	@PostMapping("portalRegister")
	public void portalRegister(MultipartHttpServletRequest mul,HttpServletResponse response ,HttpServletRequest rquest) throws Exception {
		String message = service.portalRegister(mul, rquest);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html chartest=utf-8");
		out.print(message);
	}
	@GetMapping("portalContentView")
		public String portalContentView(@RequestParam("writeNo") int writeNo, Model model ) {
		service.portalContentView(writeNo, model);
		return "portalBoard/portalContentView";
		}
	
	@GetMapping("portalDownload")
	public void portalDownload(@RequestParam String fileupload,
						HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition","attachment;imageFileName="+fileupload);
		File file = new File(BoardFileService.IMAGE_REPO+"/"+fileupload);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	@GetMapping("portalModify")
	public String portalModify(@RequestParam("writeNo")int writeNo, Model model) {
		service.portalContentView(writeNo,model);
		return "portalBoard/portalModify";
	}
	@PostMapping("portalModify")
	public void portalModify(MultipartHttpServletRequest mul,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		String message = service.portalModify(mul, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}
	@GetMapping("portalDelete")
	public void portalDelete(@RequestParam int writeNo,
						@RequestParam String fileupload,
						HttpServletResponse response,
						HttpServletRequest request) throws Exception {
		String message = service.portalDelete(writeNo, fileupload, request);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.print(message);
	}

	
}

















