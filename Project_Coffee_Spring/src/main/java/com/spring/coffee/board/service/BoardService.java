package com.spring.coffee.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.board.dto.BoardDto;

public interface BoardService {
	public ModelAndView getList(HttpServletRequest request, int pageNum);
	public Map<String, Object> getData(HttpServletRequest request, int num);
	public void insert(HttpServletRequest request, BoardDto dto);
}
