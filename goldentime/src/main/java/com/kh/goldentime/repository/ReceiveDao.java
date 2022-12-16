package com.kh.goldentime.repository;

import com.kh.goldentime.entity.ReceiveDto;

public interface ReceiveDao {
	//환자 접수되면서 & 환자 정보도 입력
	void insert(String staffId, int patientNo);
}
