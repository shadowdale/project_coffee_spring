package com.spring.coffee.admin.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.coffee.users.dto.UsersDto;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public boolean suspended(UsersDto usersDto) {
		session.update("users.suspended", usersDto);
		return false;
	}

}
