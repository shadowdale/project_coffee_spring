package com.spring.coffee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.coffee.admin.dao.AdminDao;
import com.spring.coffee.users.dto.UsersDto;

@Component
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public boolean suspended(UsersDto dto, boolean isChecked) {
		
		if(isChecked) {
			dto.setSuspended(1);
			adminDao.suspended(dto);
		} else {
			dto.setSuspended(0);
			adminDao.suspended(dto);
		}
		
		return false;
	}
}
