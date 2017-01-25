package com.spring.coffee.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시글 목록 불러오기 요청 처리
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum) {
		
		// 서비스에 객체를 전달하고 전달받은 모델을 가지고 뷰페이지로 forword 시킨다.
		ModelAndView mView = boardService.getList(request, pageNum);
		mView.setViewName("/board/list");
		return mView;
	}
	
	// 게시글 자세히 보기 요청 처리
	@RequestMapping("/board/detail")
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, @RequestParam int num) {
		return boardService.getData(request, num);
	}
}
