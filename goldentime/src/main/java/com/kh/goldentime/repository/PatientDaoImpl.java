package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.vo.PatientDepartmentVO;
import com.kh.goldentime.vo.PatientPhoneNameVO;
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

	//예약 리스트 관련된 구문 (건들지 않기)
	@Override
	public List<PatientDto> patientList() {
		return sqlSession.selectList("patient.patientList");
	}

	//내과 금일 환자 현황
	@Override
	public List<PatientDepartmentVO> internalList() {
		return sqlSession.selectList("patient.list2");
	}
	
	//외과 금일 환자 현황
	@Override
	public List<PatientDepartmentVO> surgeonList() {
		return sqlSession.selectList("patient.list3");
	}
		
	//정형외과 금일 환자 현황
	@Override
	public List<PatientDepartmentVO> orthopaedicList() {
		return sqlSession.selectList("patient.list4");
	}
	
	//영상의학과 금일 환자 현황
	@Override
	public List<PatientDepartmentVO> radiologyList() {
		return sqlSession.selectList("patient.list5");
	}
		
	//원무과에서 볼 수 있는 환자 기록
	@Override
	public List<PatientReceiveListVO> historyList() {
		return sqlSession.selectList("patient.list");
	}
	
	//비동기
	@Override
	public List<PatientDto> patientConfirm(PatientPhoneNameVO patientPhoneNameVO) {
		return sqlSession.selectList("patient.patientConfirm", patientPhoneNameVO);
	}

	@Override
	public PatientDto selectOne(int patientNo) {
		return sqlSession.selectOne("patient.selectOne", patientNo);
	}
		
	
}
