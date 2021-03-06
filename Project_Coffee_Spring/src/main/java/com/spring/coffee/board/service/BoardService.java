package com.spring.coffee.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.board.dto.BoardDto;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public ModelAndView getData(HttpServletRequest request, int num);
	public void insert(HttpServletRequest request, BoardDto dto);
	public void delete(HttpServletRequest request, BoardDto dto);
	public void update(HttpServletRequest request, BoardDto dto);
}
