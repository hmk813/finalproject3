package com.kh.goldentime.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return sqlSession.selectOne("attachment.sequence");
	}

	@Override
	public void insert(AttachmentDto attachmentDto) {
		sqlSession.insert("attachment.insert", attachmentDto);
	}
	
	@Override
	public List<AttachmentDto> selectList() {
		return sqlSession.selectList("attachment.list");
	}
	
	@Override
	public AttachmentDto selectOne(int attachmentNo) {
		return sqlSession.selectOne("attachment.one",attachmentNo);
	}
	
	@Override
	public boolean delete(int attachmentNo) {
		int count = sqlSession.delete("attachment.delete", attachmentNo);
		return count > 0;
	}

	@Override
	public void insertAttachment(String staffId, int attachmentNo) {
		Map<String, String> param = new HashMap<>();//변수로 사용할 Map
		param.put("staffId", String.valueOf(staffId));
		param.put("attachmentNo", String.valueOf(attachmentNo));
		
		sqlSession.insert("attachment.insertAttachment", param);
	}
}
