package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.vo.PatientReceiveListVO;

public interface PatientDao {
	
	//환자 접수되면서 & 환자 정보도 입력
	void insert(PatientDto dto);
	
	//환자 접수 수정
	boolean edit(PatientDto pdto);

	//환자 현황 조회
	List<PatientReceiveListVO> todayList();
	
	//환자 기록 조회
	List<PatientReceiveListVO> historyList();


}
