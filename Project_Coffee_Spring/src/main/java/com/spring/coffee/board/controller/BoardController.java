package com.spring.coffee.board.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.coffee.board.dto.BoardDto;
import com.spring.coffee.board.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	// 게시글 목록 불러오기 요청 처리
	@RequestMapping("/board/list")
	public ModelAndView list(HttpServletRequest request, @RequestParam(defaultValue="1") int pageNum) {
		
		// 서비스에 파라미터로 전송된 값을 전달하고 모델을 리턴 받는다.
		ModelAndView mView = boardService.getList(request, pageNum);
		
		// 뷰페이지로 이동한다.
		mView.setViewName("/board/list");
		return mView;
	}
	
	// 게시글 자세히 보기 요청 처리
	@RequestMapping("/board/detail")
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, @RequestParam int num) {
		
		// Map 객체를 생성한다.
		Map<String, Object> map = new HashMap<String, Object>();
		
		// ModelAndView 객체를 생성한다.
		ModelAndView mView = new ModelAndView();
		
		// 서비스에 파라미터로 전달된 값을 전달하고 ModelAndView 객체를 리턴 받는다.
		mView = boardService.getData(request, num);
		
		// ModelAndView 객체를 Map형태로 변환하여 담는다
		map = mView.getModel();
		
		// Map 객체를 리턴한다.
		return map;
	}
	
	// 새글 작성 폼 요청 처리
	@RequestMapping("/board/insertform")
	public ModelAndView authInsertFrom() {
		
		// ModelAndView 객체를 생성하여 뷰페이지로 이동한다.
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/board/insertform");
		return mView;
	}
	
	// 새글 입력 요청 처리
	@RequestMapping("/board/insert")
	public ModelAndView authInsert(HttpServletRequest request, @ModelAttribute BoardDto dto) {
		
		// 전송된 파라미터값을 전달한다.
		boardService.insert(request, dto);
		
		// ModelAndView 객체를 생성하여 뷰페이지로 이동한다.
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/board/list.do");
		
		return mView;
	}
	
	// 게시글 삭제 요청 처리
	@RequestMapping("/board/delete")
	public ModelAndView authDelete(HttpServletRequest request, @ModelAttribute BoardDto dto) {
		
		// 전송된 파라미터값을 전달한다.
		boardService.delete(request, dto);
		
		// ModelAndView 객체를 생성하여 뷰페이지로 이동한다.
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/board/list.do");
		return mView;
	}
	
	// 게시글 수정 폼 요청 처리
	@RequestMapping("/board/updateform")
	public ModelAndView authUpdateForm(HttpServletRequest request, @RequestParam int num) {
		
		// ModelAndView 객체를 생성한다.
		ModelAndView mView = new ModelAndView();
		
		// 파라미터로 전송된 값을 전달하고 ModelAndView 객체로 리턴 받는다.
		mView = boardService.getData(request, num);
		
		// 뷰페이지로 이동한다.
		mView.setViewName("/board/updateform");
		return mView;
	}
	
	// 게시글 수정 요청 처리
	@RequestMapping("/board/update")
	public ModelAndView authUpdate(HttpServletRequest request, @ModelAttribute BoardDto dto) {
		
		
		// 파라미터로 전송된 값을 전달한다.
		boardService.update(request, dto);
		
		// ModelAndView 객체를 생성한다.
		ModelAndView mView = new ModelAndView();
		mView.setViewName("redirect:/board/list.do");
		
		return mView;
	}
} 
