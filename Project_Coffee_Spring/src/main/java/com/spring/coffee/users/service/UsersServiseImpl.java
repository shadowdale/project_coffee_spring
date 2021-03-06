package com.spring.coffee.users.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.users.dao.UsersDao;
import com.spring.coffee.users.dto.UsersDto;

@Component
public class UsersServiseImpl implements UsersService {

	// 비밀번호 인코더 객체
	private PasswordEncoder pEncoder = new BCryptPasswordEncoder();
	
	@Autowired
	private UsersDao usersDao;
	
	@Override
	public void insert(UsersDto dto) {
		
		// 암호화 된 비밀번호를 얻어낸다.
		String encodedPwd = pEncoder.encode(dto.getPwd());
		
		// Dto 객체에 다시 넣어준다.
		dto.setPwd(encodedPwd);

		usersDao.insert(dto);

	}

	@Override
	public Map<String, Object> isValid(UsersDto dto) {
		
		boolean isValid = false;
		boolean isSuspended = false;
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 아이디에 해당하는 DB에 저장된 암호화된 비밀번호를 읽어온다.
		String password = usersDao.getPassword(dto.getId());
		UsersDto resultDto = usersDao.getData(dto.getId());
		
		if(password != null) { // 아이디가 일단 존재 하는 경우
			
			// .maches(사용자가 입력한 비밀번호, DB에 저장된 암호롸 비밀번호)
			// 를 이용해서 비밀번호가 맞는지 여부를 boolean Type으로 리턴받기
			isValid = pEncoder.matches(dto.getPwd(), password);
			if(resultDto.getSuspended() == 1) {
				isSuspended = true;
			}
		}
		map.put("isValid", isValid);
		map.put("isSuspended", isSuspended);
		
		return map;
	}

	@Override
	public ModelAndView getData(String id) {
		UsersDto dto = usersDao.getData(id);
		ModelAndView mView = new ModelAndView();
		mView.addObject("dto", dto);
		return mView;	
	}

	@Override
	public void update(UsersDto dto) {
		
		// 암호화 된 비밀번호를 얻어낸다.
		String encodedPwd = pEncoder.encode(dto.getPwd());
		
		// Dto 객체에 다시 넣어준다.
		dto.setPwd(encodedPwd);
		
		usersDao.update(dto);
	}

	@Override
	public void delete(String id) {
		usersDao.delete(id);
	}

	@Override
	public ModelAndView getList() {
		List<UsersDto> list = usersDao.getList();
		ModelAndView mView = new ModelAndView();
		mView.addObject("list", list);
		return mView;
	}

	@Override
	public Map<String, Object> canUseId(String id) {
		boolean canUse =  usersDao.canUseId(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("canUse", canUse);
		return map;
		
	}

}
