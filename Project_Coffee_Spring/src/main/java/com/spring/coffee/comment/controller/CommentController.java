package com.spring.coffee.comment.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public Map<String, Object> commentInsert(@ModelAttribute CommentDto dto) {
		commentService.insert(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", dto.getWriter());
		map.put("cotent", dto.getContent());
		return map;
	}
}
