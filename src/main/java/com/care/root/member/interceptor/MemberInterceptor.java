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
public class MemberInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired MemberDAO dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//사용자가 로그인해야만 접근 가능한 특정 페이지를 세션이 없는 상태에서 요청할 경우 login 페이지로 redirect
		HttpSession session = request.getSession();
		if(session.getAttribute(MemberSessionName.LOGIN) == null) {
			//response.sendRedirect("login");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script> alert('로그인을 먼저 진행해 주세요.'); location.href='/root/login'; </script>");
			return false;
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
