package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.vo.HospitalizeInformationVO;


public interface HospitalizeDao {

// 목록 조회
	List<HospitalizeInformationVO>  selectList();
	
	// 단일 조회 
	HospitalizeInformationVO selectOne(int patientNo);
	List<PatientDto> selectPatientList();
}
