package com.spring.coffee.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.coffee.event.dao.EventDao;

@Component
public class AdminServiceImpl implements AdminService {

	@Autowired
	private EventDao eventDao;
}
