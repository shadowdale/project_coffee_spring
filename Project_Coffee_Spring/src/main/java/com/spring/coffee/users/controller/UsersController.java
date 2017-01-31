package com.spring.coffee.users.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.users.dto.UsersDto;
import com.spring.coffee.users.service.UsersService;

@Controller
public class UsersController{
	
	@Autowired
	private UsersService usersService;
	
	// 회원가입폼 요청 처리
	@RequestMapping("/users/signupform")
	public String signupForm() {
		return "/users/signupform";
	}
	
	// 아이디 중복 확인 요청 처리
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkId(@RequestParam String inputId) {
		
		return usersService.canUseId(inputId);
	}
	
	// 회원 가입 요청 처리
	@RequestMapping("/users/signup")
	public ModelAndView signup(@ModelAttribute UsersDto dto, HttpServletRequest request) {
		usersService.insert(dto);
		
		ModelAndView mView = new ModelAndView();
		mView.addObject("msg", dto.getId()+"회원님 가입을 축하드립니다.");
		mView.addObject("redirectUri", request.getContextPath());
		mView.setViewName("/users/alert");
		
		return mView;
	}
	
	// 로그인 요청 처리
	@RequestMapping("/users/signin")
	@ResponseBody
	public Map<String, Object> signin(HttpSession session, @ModelAttribute UsersDto dto) {
		// 세션을 초기화 한다
		session.removeAttribute("id");
		
		// 입력된 아이디와 비밀번호를 확인한다.
		boolean isValid = usersService.isValid(dto);
		
		// 입력된 값이 참이라면
		if(isValid) {
			// 세션에 아이디를 저장한다.
			session.setAttribute("id", dto.getId());
		}
		// Map에 담아서
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isValid", isValid);
		
		// 리턴해준다.
		return map;
	}
	
	// 로그아웃 요청 처리
	@RequestMapping("/users/signout")
	@ResponseBody
	public Map<String, Object> signout(HttpSession session) {
		// 세션을 초기화 한다.
		session.invalidate();
		
		// 아무값이나 응답해준다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isValid", false);
		
		return map;
	}
	
	//회원정보 요청 처리
	@RequestMapping("/users/private/info")
	public ModelAndView info(HttpSession session){
		String id = (String)session.getAttribute("id");
		ModelAndView mView = usersService.getData(id);
		mView.setViewName("users/private/info");
		return mView;
	}
	
}
