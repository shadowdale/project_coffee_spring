package com.spring.coffee.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.event.dao.EventDao;
import com.spring.coffee.event.dto.EventDto;

@Component
public class EventServiceImpl implements EventService{

	@Autowired
	private EventDao eventDao;
	
	@Override
	public ModelAndView getList() {
		List<EventDto> list = eventDao.getList();
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", list);
		return mView;
	}

}
