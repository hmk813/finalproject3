package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.ReceiveDto;

@Repository
public class ReceiveDaoImpl implements ReceiveDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ReceiveDto rdto) {
		sqlSession.insert("receive.insert", rdto);
	}
}
