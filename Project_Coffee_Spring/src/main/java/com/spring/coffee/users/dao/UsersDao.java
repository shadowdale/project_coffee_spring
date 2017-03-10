package com.spring.coffee.users.dao;

import java.util.List;

import com.spring.coffee.users.dto.UsersDto;

public interface UsersDao {
	public void insert(UsersDto dto);
	public String getPassword(String id);
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public void delete(String id);
	public List<UsersDto> getList();
	public boolean canUseId(String id);
}
