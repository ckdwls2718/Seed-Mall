package com.my.interceptor;

import javax.servlet.RequestDispatcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.user.model.MemberVO;

import lombok.extern.log4j.Log4j;
//servlet-context.xml에 AdminCheckInterceptor빈을 등록하고 매핑한다
@Log4j
public class AdminCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		log.info("AdminCheck preHandle()");
		HttpSession ses=req.getSession();
		MemberVO member=(MemberVO)ses.getAttribute("loginUser");
		
		req.setAttribute("message", "관리자만 이용 가능합니다");
		req.setAttribute("loc", req.getContextPath()+"/");
		RequestDispatcher disp=req.getRequestDispatcher("/WEB-INF/views/msg.jsp");
		
		if(member!=null) {
			if(member.getStatus()!=9) {
				
				disp.forward(req, res);
				
				return false;//관리자가 아닌 경우
			}else {
				return true;//관리자가 맞다면 true반환
			}
		}
		disp.forward(req, res);
		return false;//로그인 하지 않은 경우		
	}

}
