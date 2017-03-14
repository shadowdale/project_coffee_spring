package com.spring.coffee.admin.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.event.dto.EventDto;
import com.spring.coffee.users.dto.UsersDto;

public interface AdminService {
	public boolean suspended(UsersDto dto, boolean isChecked);
	public void eventUpdate(HttpServletRequest session, EventDto dto);
	public ModelAndView getEventList();
	public ModelAndView getEventData(int num);
	public boolean endEvent(EventDto dto, boolean isChecked);
}
