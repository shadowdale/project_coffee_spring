package com.spring.coffee.event.dao;

import java.util.List;

import com.spring.coffee.event.dto.EventDto;

public interface EventDao {
	public List<EventDto> getList();
}
