package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.PatientDto;

@Repository
public class PatientDaoImpl implements PatientDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(PatientDto patientDto) {
		sqlSession.insert("patient.add", patientDto);
	}
	
}
