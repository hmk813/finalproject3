package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.vo.PatientReceiveListVO;

public interface PatientDao {
	
	// 환자 번호 뽑기 
	int patientseq();
	
	//환자 접수되면서 & 환자 정보도 입력 -> 번호 뽑아서 등록하는 방식으로 변경
	void insert(PatientDto patientdto);
	
	//환자 접수 수정
	boolean edit(PatientDto pdto);

	//환자 현황 조회
	List<PatientReceiveListVO> todayList();

	List<PatientDto> patientList();
}
