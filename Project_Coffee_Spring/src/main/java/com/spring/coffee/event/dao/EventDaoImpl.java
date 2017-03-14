package com.spring.coffee.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.coffee.event.dto.EventDto;

@Repository
public class EventDaoImpl implements EventDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<EventDto> getList() {
		List<EventDto> list = session.selectList("event.getList");
		
		return list;
	}

}
