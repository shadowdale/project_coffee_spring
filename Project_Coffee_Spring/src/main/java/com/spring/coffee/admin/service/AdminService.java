package com.spring.coffee.admin.service;

import com.spring.coffee.users.dto.UsersDto;

public interface AdminService {
	public boolean suspended(UsersDto dto, boolean isChecked);
}
