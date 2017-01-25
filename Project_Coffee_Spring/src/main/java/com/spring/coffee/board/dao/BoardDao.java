package com.spring.coffee.board.dao;

import java.util.List;

import com.spring.coffee.board.dto.BoardDto;

public interface BoardDao {
	public void insert(BoardDto dto);
	public void delete(int num);
	public void update(BoardDto dto);
	public List<BoardDto> getList(BoardDto dto);
	public void increaseViewCount(int num);
	public int getCount(BoardDto dto);
	public BoardDto getData(BoardDto dto);
}
