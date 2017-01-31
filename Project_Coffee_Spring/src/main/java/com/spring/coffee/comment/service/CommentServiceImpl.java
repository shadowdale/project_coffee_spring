package com.spring.coffee.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.coffee.comment.dao.CommentDao;
import com.spring.coffee.comment.dto.CommentDto;

@Component
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Override
	public void insert(CommentDto dto) {
		int seq = commentDao.getSequence();
		dto.setNum(seq);
		System.out.println(seq);
		if(dto.getComment_group() == 0) {//원글에 대한 덧글인 경우
			//덧글의 그룹번호를 덧글의 글번호와 같게 설정한다.
			dto.setComment_group(seq);
		}
		commentDao.insert(dto);
		
	}

	@Override
	public List<CommentDto> getList(int ref_group) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSequence() {
		return commentDao.getSequence();
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
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
