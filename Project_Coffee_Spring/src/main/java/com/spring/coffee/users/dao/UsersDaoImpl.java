package com.spring.coffee.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.coffee.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto); 
	}

	@Override
	public String getPassword(String id) {
		String password = session.selectOne("users.getPwd", id);
		return password;
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto = session.selectOne("users.getData", id);
		return dto;
	}

	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}

	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	@Override
	public List<UsersDto> getList() {
		List<UsersDto> list = new ArrayList<UsersDto>();
		list = session.selectList("users.getList");
		return list;
	}

	@Override
	public boolean canUseId(String id) {
		String result = session.selectOne("users.isExistId", id);
		
		if(result == null) {
			return true;
		} else {
			return false;
		}
	}

}
