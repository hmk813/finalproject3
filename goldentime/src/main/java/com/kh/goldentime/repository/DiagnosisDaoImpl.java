package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.DiagnosisDto;

@Repository
public class DiagnosisDaoImpl implements DiagnosisDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DiagnosisDto> list() {
		return sqlSession.selectList("patient.list");
	}
	
	@Override
	public boolean edit(DiagnosisDto dto) {
		int count = sqlSession.update("diagnosis.edit", dto);
		return count > 0;
	}
}
