package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;

public interface PatientDao {
	void insert(PatientDto patientDto);
	List<PatientDto> list();
}
