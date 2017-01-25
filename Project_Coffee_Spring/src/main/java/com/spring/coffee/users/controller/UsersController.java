package com.spring.coffee.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.coffee.users.service.UsersService;

@Controller
public class UsersController{
	
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("/users/signupform")
	public String signupForm() {
		return "/users/signupform";
	}
	
}
