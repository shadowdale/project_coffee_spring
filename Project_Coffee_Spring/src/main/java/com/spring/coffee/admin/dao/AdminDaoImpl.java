package com.spring.coffee.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.coffee.event.dto.EventDto;
import com.spring.coffee.users.dto.UsersDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public boolean suspended(UsersDto dto) {
		session.update("admin.suspended", dto);
		return false;
	}

	@Override
	public void eventUpdate(EventDto dto) {
		session.update("admin.eventUpdate", dto);
		
	}

	@Override
	public List<EventDto> getEventList() {
		List<EventDto> list = session.selectList("admin.getEventList");
		return list;
	}

	@Override
	public EventDto getEventData(int num) {
		EventDto resultDto = session.selectOne("admin.getEventData", num);
		return resultDto;
	}

	@Override
	public boolean endEvent(EventDto dto) {
		session.update("admin.endEvent", dto);
		return false;
	}

}
