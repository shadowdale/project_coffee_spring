package com.spring.coffee.users.dao;

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
	public boolean isValid(UsersDto dto) {
		UsersDto resultDto = session.selectOne("users.isValid", dto);
		if(resultDto == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto = session.selectOne("users.getData", id);
		return dto;
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
	public boolean canUseId(String id) {
		String result = session.selectOne("users.isExistId", id);
		
		if(result == null) {
			return true;
		} else {
			return false;
		}
	}

}
