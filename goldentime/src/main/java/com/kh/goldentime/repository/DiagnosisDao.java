package com.kh.goldentime.repository;

import com.kh.goldentime.entity.DiagnosisDto;

public interface DiagnosisDao {
	boolean edit(DiagnosisDto diagnosisDto); //진료 수정
	void insert(DiagnosisDto diagnosisDto); //진료 입력
	int sequence(); //시퀀스 발행 
	DiagnosisDto selectOne(int diagnosisNo); //환자 기록에서 진료 상세보기
}
