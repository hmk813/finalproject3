package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.vo.PatientReceiveListVO;

@Repository
public class PatientDaoImpl implements PatientDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(PatientDto dto) {
		sqlSession.insert("patient.insert", dto);
	}
	
	@Override
	public boolean edit(PatientDto pdto) {
		int count = sqlSession.update("patient.edit", pdto);
		return count > 0;
	}
	
	@Override
	public List<PatientReceiveListVO> todayList() {
		return sqlSession.selectList("patient.list");
	}
	
	@Override
	public List<PatientReceiveListVO> historyList() {
		return sqlSession.selectList("patient.list");
	}
	
}
