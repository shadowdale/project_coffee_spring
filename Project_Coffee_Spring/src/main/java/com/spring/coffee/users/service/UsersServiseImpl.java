package com.spring.coffee.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.coffee.users.dao.UsersDao;
import com.spring.coffee.users.dto.UsersDto;

@Component
public class UsersServiseImpl implements UsersService {

	@Autowired
	private UsersDao usersDao;
	
	@Override
	public void insert(UsersDto dto) {
		usersDao.insert(dto);

	}

	@Override
	public boolean isValid(UsersDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UsersDto getData(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(UsersDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UsersDto> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> canUseId(String id) {
		boolean canUse =  usersDao.canUseId(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("canUse", canUse);
		return map;
		
	}

}
