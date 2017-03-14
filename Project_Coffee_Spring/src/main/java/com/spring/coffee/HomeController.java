package com.spring.coffee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.event.service.EventService;

@Controller
public class HomeController {
	
	@Autowired
	private EventService eventService; 

	@RequestMapping(value = "/main")
	public String home() {

		return "main";
	}
	
	@RequestMapping(value = "/recipe")
	public String recipe() {

		return "recipe";
	}
	
	@RequestMapping(value = "/event")
	public ModelAndView eventList() {
		
		ModelAndView mView = eventService.getList();
		mView.setViewName("/event");
		
		return mView;
	}
	
	@RequestMapping(value = "/menu")
	public String main() {

		return "menu";
	}

}
