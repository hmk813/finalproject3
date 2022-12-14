package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.vo.PatientDepartmentVO;
import com.kh.goldentime.vo.PatientPhoneNameVO;
import com.kh.goldentime.vo.PatientReceiveListVO;

public interface PatientDao {
	
	// 환자 번호 뽑기 
	int patientseq();
	
	//환자 접수되면서 & 환자 정보도 입력 -> 번호 뽑아서 등록하는 방식으로 변경
	void insert(PatientDto patientdto);
	
	//환자 접수 수정
	boolean edit(PatientDto pdto);
	
	PatientDto selectOne(int patientNo);

	//환자 현황 조회
	List<PatientReceiveListVO> todayList();
	
	//내과 금일 환자 현황 조회
	List<PatientDepartmentVO> internalList();

	//외과 금일 환자 현황 조회
	List<PatientDepartmentVO> surgeonList();
	
	//정형외과 금일 환자 현황 조회
	List<PatientDepartmentVO> orthopaedicList();
	
	//영상의학과 금일 환자 현황 조회
	List<PatientDepartmentVO> radiologyList();
	
	//원무과 환자 기록 조회
//	List<PatientReceiveListVO> historyList();
//	
//	//내과 환자 기록 현황 조회
//	List<PatientDepartmentVO> internalHistoryList();
//
//	//외과 금일 환자 현황 조회
//	List<PatientDepartmentVO> surgeonHistoryList();
//		
//	//정형외과 금일 환자 현황 조회
//	List<PatientDepartmentVO> orthopaedicHistoryList();
//		
//	//정형외과 금일 환자 현황 조회
//	List<PatientDepartmentVO> radiologyHistoryList();
	
	//접수 비동기 구현
	List<PatientDto> patientConfirm(PatientPhoneNameVO patientPhoneNameVO);
	
	//환자 조회 (예약과 관련, 건들지 않기)
	List<PatientDto> patientList();
}
