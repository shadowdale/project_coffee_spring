package com.spring.coffee.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.admin.service.AdminService;
import com.spring.coffee.event.dto.EventDto;

public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	// 이벤트 글 작성페이지 요청처리
	@RequestMapping("/admin/event/insertform")
	public ModelAndView adminEventIndertForm() {
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/adim/insertform");
		return mView;
	}
	
	// 이벤트 글 작석 요청 처리
	@RequestMapping("/admin/event/insert")
	public ModelAndView adminEventIndert(@ModelAttribute EventDto dto){
		
		return null;
	}
}
