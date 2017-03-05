package com.spring.coffee.comment.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.coffee.comment.dto.CommentDto;
import com.spring.coffee.comment.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	// 댓글 입력 요청 처리
	@RequestMapping("/board/commentinsert")
	@ResponseBody
	public Map<String, Object> commentAuthInsert(HttpSession session, @ModelAttribute CommentDto dto) {
		dto.setWriter((String)session.getAttribute("id"));
		int num = commentService.insert(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", dto.getWriter());
		map.put("content", dto.getContent());
		map.put("num", num);
		map.put("isLoginCheck", true);
		return map;
	}
	
	// 댓글 삭제 요청 처리
	@RequestMapping("/board/commentdelete")
	@ResponseBody
	public Map<String, Object> commentAuthDelete(@RequestParam int num) {
		commentService.delete(num);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isLoginCheck", true);
		
		return map;
	}
	
	// 댓글 수정 요청 처리
	@RequestMapping("/board/commentupdate")
	@ResponseBody
	public Map<String, Object> commentAuthUpdate(@ModelAttribute CommentDto dto) {
		commentService.update(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isLoginCheck", true);
		return map;
	}
}
