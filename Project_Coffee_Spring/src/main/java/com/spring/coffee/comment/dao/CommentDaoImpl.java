package com.spring.coffee.comment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.coffee.comment.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(CommentDto dto) {
		session.insert("comment.insert", dto);
		
	}

	@Override
	public List<CommentDto> getList(int ref_group) {
		List<CommentDto> list = session.selectList("comment.getList", ref_group);
		return list;
	}

	@Override
	public int getSequence() {
		return session.selectOne("comment.getSequence");
		
	}

	@Override
	public void delete(int num) {
		session.delete("comment.delete", num);
		
	}

	@Override
	public void deleteCommentAll(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateContent(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean update(CommentDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void deleteRefgroup(int num) {
		// TODO Auto-generated method stub
		
	}

}
