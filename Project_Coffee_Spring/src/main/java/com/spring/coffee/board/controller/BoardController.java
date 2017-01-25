package com.spring.coffee.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum) {
		boardService.getList(request, pageNum);
		
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/board/list");
		return mView;
	}
}
