package com.spring.coffee.board.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class LoginAspect {
	
	@Around("execution(* auth*(..))")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
		
		// 컨트롤러에 aop를 적용했을 때 HttpServletRequest 참조값 얻어오기
		ServletRequestAttributes attrs = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attrs.getRequest();
		
		// 세션객체의 참조값 얻어오기
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null ) {
			
			//원래 요청 uri 정보 얻어오기
			String uri = request.getRequestURI();
			String path = "/board/list.do?uri="+uri;
			
			ModelAndView mView = new ModelAndView();
			mView.setViewName("redirect:"+path);
			
			// joinPoint.poceed()메소드를 호출하지 않고 바로 리턴하면 aop가 적용된 메소드안에 있는 작업이 수행되지 않는다.
			// 여기서 리턴해주는 참조값이 aop가 적용된 메소드에 리턴된다.
			// 그러므로 여기서 리턴해주는 data Type과 aop가 적용된 메소드의 리턴 Type은 반드시 같아야 한다.
			return mView;
			
		} else {
			
			// 여기가 수행되면 aop가 적용된 메소드가 정상 수행된다.
			return joinPoint.proceed();
			
		}
	}
}
