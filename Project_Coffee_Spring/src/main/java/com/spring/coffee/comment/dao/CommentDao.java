package com.spring.coffee.comment.dao;

import java.util.List;

import com.spring.coffee.comment.dto.CommentDto;

public interface CommentDao {
	public void insert(CommentDto dto);
	public List<CommentDto> getList(int ref_group);
	public int getSequence();
	public void delete(int num);
	public void deleteCommentAll(int num);
	public void updateContent(int num);
	public boolean update(CommentDto dto);
	public void deleteRefgroup(int num);
}
