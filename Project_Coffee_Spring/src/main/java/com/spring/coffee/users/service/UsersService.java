package com.spring.coffee.users.service;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.users.dto.UsersDto;

public interface UsersService {
	public void insert(UsersDto dto);
	public Map<String, Object> isValid(UsersDto dto);
	public ModelAndView getData(String id);
	public void update(UsersDto dto);
	public void delete(String id);
	public ModelAndView getList();
	public Map<String, Object> canUseId(String id);
	public boolean suspended(UsersDto dto, boolean isChecked);
}
