package com.spring.coffee.admin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.admin.service.AdminService;
import com.spring.coffee.event.dto.EventDto;
import com.spring.coffee.users.dto.UsersDto;
import com.spring.coffee.users.service.UsersService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UsersService usersService;
	
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
	
	// 회원 목록보기 폼 요청 처리
	@RequestMapping("/admin/user-list")
	public ModelAndView adminGetList() {
		ModelAndView mView = usersService.getList();
		mView.setViewName("/admin/user-list");
		
		return mView;
	}
	
	// 회원 계정 관리
	@RequestMapping("/admin/suspended")
	@ResponseBody
	public Map<Object, String> adminSuspended(@ModelAttribute UsersDto dto , @RequestParam boolean isChecked) {
		adminService.suspended(dto, isChecked);
		
		Map<Object, String> map = new HashMap<Object, String>();
		map.put("isChecked", "");
		return map;
	}
	
}
