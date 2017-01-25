package com.spring.coffee.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);

}
