package com.spring.coffee.admin.dao;

import java.util.List;

import com.spring.coffee.event.dto.EventDto;
import com.spring.coffee.users.dto.UsersDto;

public interface AdminDao {
	public boolean suspended(UsersDto dto);
	public void eventUpdate(EventDto dto);
	public List<EventDto> getEventList();
	public EventDto getEventData(int num);
	public boolean endEvent(EventDto dto);
}
