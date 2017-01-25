package com.spring.coffee.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.coffee.users.service.UsersService;

@Controller
public class UsersController{
	
	@Autowired
	private UsersService usersService;
	
	
}
