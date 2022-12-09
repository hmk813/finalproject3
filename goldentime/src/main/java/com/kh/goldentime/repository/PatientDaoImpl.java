package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.PatientDto;

@Repository
public class PatientDaoImpl implements PatientDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(PatientDto dto) {
		sqlSession.insert("patient.insert", dto);
	}
	
	@Override
	public List<PatientDto> list() {
		return sqlSession.selectList("patient.list");
	}
	
	@Override
	public boolean edit(PatientDto dto) {
		int count = sqlSession.update("patient.edit", dto);
		return count > 0;
	}
}
