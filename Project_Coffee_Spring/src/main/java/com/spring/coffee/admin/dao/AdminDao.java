package com.spring.coffee.admin.dao;

import com.spring.coffee.users.dto.UsersDto;

public interface AdminDao {
	public boolean suspended(UsersDto Dto);
}
