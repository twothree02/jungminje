package com.care.root.member.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.session.MemberSessionName;
import com.care.root.member.dao.MemberDAO;

/** servlet-context.xml에 bean 추가 필요 */
public class ModifyInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired MemberDAO dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//사용자가 처음 로그인한 사용자인 경우 기본 정보 추가 입력을 위해 modifyInfo 페이지로 redirect
		HttpSession session = request.getSession();
		if(session.getAttribute(MemberSessionName.LOGIN) != null) {
			String chkFirst = dao.chkFirst((String) session.getAttribute(MemberSessionName.LOGIN));
			if(chkFirst.equals("Y")) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print("<script> alert('처음 로그인한 사용자입니다. 기본 정보 추가 입력을 위해 정보 수정을 먼저 진행해 주세요.'); location.href='/root/modifyInfo'; </script>");
				return false;
			}
		}
		
		//return super.preHandle(request, response, handler);
		return true;	//true가 return되어야 다음 페이지가 실행됨
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
	
}
