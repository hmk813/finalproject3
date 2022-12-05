package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int sequence() {
		return sqlSession.selectOne("attachement.sequence");
	}

	
	@Override
	public AttachmentDto find(int attachmentNo) {
		return sqlSession.selectOne("attachment.find",attachmentNo);
	}


	@Override
	public void save(AttachmentDto attachmentDto) {
		sqlSession.insert("attachment.save", attachmentDto);
		
	}
}
