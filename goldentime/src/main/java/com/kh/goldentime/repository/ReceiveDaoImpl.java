package com.kh.goldentime.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReceiveDaoImpl implements ReceiveDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(String staffId, int patientNo) {
		//
		Map<String, String> param = new HashMap<>();
		param.put("staffId", staffId);
		param.put("patientNo", String.valueOf(patientNo));
		//
		sqlSession.insert("receive.insert", param);
	}
}
