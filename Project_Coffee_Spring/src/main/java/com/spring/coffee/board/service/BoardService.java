package com.spring.coffee.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public Map<String, Object> getData(HttpServletRequest request, int num);
}
