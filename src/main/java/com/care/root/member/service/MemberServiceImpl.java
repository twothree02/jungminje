package com.care.root.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.care.root.member.dao.MemberDAO;
import com.care.root.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired MemberDAO mapper;
	@Autowired JavaMailSender mailSender;	//config에 설정한 bean 얻어오기

	@Override
	public int loginChk(HttpServletRequest request) {
		MemberDTO dto = mapper.loginChk(request.getParameter("inputId"));
		if(dto != null) {
			// 암호화 되기 전 코드, 암호화 완료 시 수정 필요!
			if(request.getParameter("inputPwd").equals(dto.getPw())) {
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
			out.print("<script>alert('로그아웃되었습니다. 로그인 페이지로 돌아갑니다.'); wait();</script>");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
