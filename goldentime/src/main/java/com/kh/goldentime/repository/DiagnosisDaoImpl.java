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
	public boolean edit(DiagnosisDto diagnosisDto) {//환자 현황 진료 수정
		int count = sqlSession.update("diagnosis.edit", diagnosisDto);
		return count > 0;
	}
	
	// 진료 시퀀스 
	public int sequence() {
		return sqlSession.selectOne("diagnosis.seq");
	}
	
	@Override //진료 상세보기 (환자 기록에서 볼 창)
	public DiagnosisDto selectOne(int diagnosisNo) {//진료 내역 상세보기
		return sqlSession.selectOne("diagnosis.selectone", diagnosisNo);
	}

	@Override
	public void insert(DiagnosisDto diagnosisDto) {
		sqlSession.insert("diagnosis.insert", diagnosisDto);
	}
}
