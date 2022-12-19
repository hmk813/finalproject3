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
	
	//접수 환자 등록
	@Override
	public void insert(PatientDto dto) {
		sqlSession.insert("patient.insert", dto);
	}
	
	//접수 환자 수정
	@Override
	public boolean edit(PatientDto pdto) {
		int count = sqlSession.update("patient.edit", pdto);
		return count > 0;
	}

	//환자 접수 현황 목록
	@Override
	public List<PatientReceiveListVO> todayList() {
		return sqlSession.selectList("patient.list");
	}
	

	// 환자 시퀀스 
	@Override
	public int patientseq() {
		return sqlSession.selectOne("patient.patientseq");
	}

	@Override
	public List<PatientDto> patientList() {
		return sqlSession.selectList("patient.patientList");
	}
	
	
}
