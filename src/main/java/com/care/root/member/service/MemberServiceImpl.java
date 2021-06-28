package com.care.root.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.academicdto.academicDTO;
import com.care.root.board.noticedto.noticeDTO;
import com.care.root.board.portaldto.portalDTO;
import com.care.root.common.session.MemberSessionName;
import com.care.root.member.dao.MemberDAO;
import com.care.root.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDAO mapper;
	@Autowired JavaMailSender mailSender;	//config에 설정한 bean 얻어오기

	@Override
	public int loginChk(HttpServletRequest request, HttpSession session) {
		MemberDTO dto = mapper.loginChk(request.getParameter("inputId"));
		if(dto != null) {
			// 암호화 되기 전 코드, 암호화 완료 시 수정 필요!
			if(request.getParameter("inputPwd").equals(dto.getPw())) {
				session.setAttribute(MemberSessionName.POSITION, dto.getPosition());
				return 0;
			}
		}
		return 1;
	}

	@Override
	public String findId(String name, String phone) {
		String id = mapper.findId(name, phone);
		return id;
	}

	@Override
	public String findPw(String id, String email, HttpServletRequest request, HttpServletResponse response) {
		// 암호화 되기 전 코드, 암호화 완료 시 수정 필요!
		System.out.println("서비스");
		System.out.println(id);
		System.out.println(email);
		MemberDTO dto = mapper.findPw(id, email);
		String pw = dto.getPw();
		String name = dto.getName();

		if(pw != null) {
			//임시 비밀번호 발급 후 전송
			
			//7자리 임시 비밀번호 발급
			//StringBuffer tempPw = new StringBuffer();
			String tempPw = "";
			Random rnd = new Random();
			for (int i = 0; i < 7; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			        //tempPw.append((char) ((int) (rnd.nextInt(26)) + 97));
			        tempPw += ((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			        //tempPw.append((char) ((int) (rnd.nextInt(26)) + 65));
			    	tempPw += ((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 2:
			        // 0-9
			        //tempPw.append((rnd.nextInt(10)));
			    	tempPw += ((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    }
			}
			System.out.println(tempPw);

			//임시 비밀번호 메일 전송
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			response.setContentType("text/html;charset=utf-8");
			//PrintWriter out = response.getWriter();	//사용자에게 응답을 하기 위해 writer를 얻어온 뒤 printWriter로 응답
			String str = "";
			str += "<html><body>";
			str += "<h2>" + name + " 님의 임시 비밀번호</h2>";
			str += "비밀번호 찾기를 통해 임시 비밀번호가 발급되었습니다.<br>";
			str += "보안을 위해 정보 수정에서 비밀번호를 다시 변경해 주세요.<br>";
			str += "발급된 임시 비밀번호 : <font style=\"color:blue;\"><u>" + tempPw;
			str += "</u></font></body></html>";

			sendMail(email, name + " 님 YW University 임시 비밀번호 발급", str);
			System.out.println("메일 발송 성공");
			
			int result = mapper.tempPw(tempPw, id);
			if(result == 1) {
				System.out.println("업데이트 성공");
			}
			else {
				System.out.println("업데이트 실패");
			}
		}
		return pw;
	}
	
	private void sendMail(String to, String title, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(title);
			messageHelper.setTo(to);
			messageHelper.setText(body, true);	//true : HTML 태그를 번역한 뒤 메일을 보내기 위함
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void logout(HttpSession session, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그아웃되었습니다. 로그인 페이지로 돌아갑니다.')</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<MemberDTO> getInfo(String id) {
		ArrayList<MemberDTO> memberList = mapper.getInfo(id);
		return memberList;
	}
	
	private String modifyInfo(MultipartHttpServletRequest mul, HttpServletRequest request) {
		String message = null;
		MemberDTO dto = new MemberDTO();
		
		dto.setIdNum((String) request.getSession().getAttribute(MemberSessionName.LOGIN));
		dto.setName(mul.getParameter("name"));
		dto.setPw(mul.getParameter("pw"));
		dto.setAddr(mul.getParameter("addr2"));
		dto.setDetailAddr(mul.getParameter("detailAddr"));
		if(mul.getParameter("selectDomain").equals("self")) {
			dto.setEmail(mul.getParameter("email") + "@" + mul.getParameter("domain"));
		}
		else {
			dto.setEmail(mul.getParameter("email") + "@" + mul.getParameter("selectDomain"));
		}
		
		MemberFileService mfs = new MemberFileServiceImpl();
		MultipartFile file = mul.getFile("file");
		if(file.getSize() != 0) {
			dto.setImageFile(mfs.saveFile(file));
		}
		else if(!mul.getParameter("imageFile").equals("nan")) {
			dto.setImageFile(mul.getParameter("imageFile"));
		}
		else {
			dto.setImageFile("nan");
		}
		
		int result = mapper.modify(dto);
		if(result == 1) {
			mapper.updateFirst((String) request.getSession().getAttribute(MemberSessionName.LOGIN));
			message = "<script> alert('정보가 정상적으로 수정되었습니다.');";
			message += "location.href='" + request.getContextPath() + "/main'; </script>";
		}
		else {
			message = "<script> alert('문제가 발생하였습니다. 관리자에게 문의해 주세요.'); </script>";
		}
		
		return message;
	}
	
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		String message = null;
		
		String dbBirth = mapper.getBirth((String) request.getSession().getAttribute(MemberSessionName.LOGIN));
		dbBirth = dbBirth.substring(2, dbBirth.indexOf("-"));
		System.out.println(dbBirth);
		
		/** 비밀번호, 주소, 이메일이 수정되지 않으면 수정되지 않도록 제일 처음에 막아야 함 */
		String pw = mul.getParameter("pw");
		String email = mul.getParameter("email");
		String select = mul.getParameter("selectDomain");
		String domain = mul.getParameter("domain");
		String addr = mul.getParameter("addr2");
		String detail = mul.getParameter("detailAddr");
		
//		System.out.println("p : " + pw);
//		System.out.println("e : " + email);
//		System.out.println("s : " + select);
//		System.out.println("d : " + domain);
//		System.out.println("a : " + addr);
//		System.out.println("d : " + detail);
		System.out.println(mul.getParameter("imageFile"));

		if(email.equals("") || select.equals("") || addr.equals("") || detail.equals("") || (select.equals("self") && domain.equals(""))) {
			modifyInfo(mul, request);
			message = "<script> alert('필수 정보가 누락되었습니다. 주소, 이메일을 모두 올바르게 입력했는지 확인해 주세요.');";
			message += "location.href='" + request.getContextPath() + "/modifyInfo'; </script>";
		}
		else if(pw.equals(dbBirth)) {
			modifyInfo(mul, request);
			message = "<script> alert('비밀번호가 기본값에서 수정되지 않았습니다. 비밀번호를 수정해 주세요.');";
			message += "location.href='" + request.getContextPath() + "/modifyInfo'; </script>";
		}
		else {
			message = modifyInfo(mul, request);
		}
		
		return message;
	}

	@Override
	public void rememberId(String sessionId, Date limitDate, String id) {
		Map<String , Object> dates = new HashMap<String, Object>();
		dates.put("sessionId", sessionId);
		dates.put("limitDate", limitDate);
		dates.put("idNum", id);
		
		mapper.rememberId(dates);
	}

	@Override
	public int getSessionId(String id) {
		String sessionId = mapper.getSessionId(id);
		if(sessionId != null) {
			return 1;	//학번/사번 저장 체크
		}
		return 0;	//학번/사번 저장 체크 X
	}

	@Override
	public void setNull(String id) {
		mapper.setNull(id);
	}

	@Override
	public List<noticeDTO> mainList() {
		return mapper.mainList();
	}

	@Override
	public List<portalDTO> portalMainList() {
		return mapper.portalMainList();
	}

	@Override
	public List<academicDTO> academicMainList() {
		return mapper.academicMainList();
	}

}
