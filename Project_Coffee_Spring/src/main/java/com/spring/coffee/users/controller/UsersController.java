package com.spring.coffee.users.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
}
