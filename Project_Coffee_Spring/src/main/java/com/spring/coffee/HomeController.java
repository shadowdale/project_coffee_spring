package com.spring.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = "/main")
	public String home() {

		return "main";
	}
	
	@RequestMapping(value = "/recipe")
	public String recipe() {

		return "recipe";
	}

}
