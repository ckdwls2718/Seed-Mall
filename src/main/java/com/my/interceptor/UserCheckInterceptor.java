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
public class UserCheckInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception{
		log.info("UserCheck preHandle()");
		HttpSession ses=req.getSession();
		MemberVO member=(MemberVO)ses.getAttribute("loginUser");
		if(member==null) {
			
			req.setAttribute("message", "로그인후 이용 가능합니다");
			req.setAttribute("loc", req.getContextPath()+"/login");
			RequestDispatcher disp=req.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			disp.forward(req, res);
				
			return false;//로그인 하지 않은 경우
		}
		return true;		
	}

}
