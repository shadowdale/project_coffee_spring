package com.spring.coffee.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.coffee.board.dto.BoardDto;
@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(BoardDto dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardDto> getList(BoardDto dto) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		list = session.selectList("board.getList", dto);
		return list;
	}

	@Override
	public void increaseViewCount(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getCount(BoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDto getData(BoardDto dto) {
		// TODO Auto-generated method stub
		return null;
	}

}
