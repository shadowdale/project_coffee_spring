package com.spring.coffee.users.service;

import java.util.List;

import com.spring.coffee.users.dto.UsersDto;

public interface UsersService {
	public boolean insert(UsersDto dto);
	public boolean isValid(UsersDto dto);
	public UsersDto getData(String id);
	public void update(UsersDto dto);
	public void delete(String id);
	public List<UsersDto> getList();
	public boolean canUseId(String id);
}
