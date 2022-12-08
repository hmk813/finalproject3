package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;

public interface PatientDao {
	void insert(PatientDto dto);
	List<PatientDto> list();
	boolean edit(PatientDto dto);
}
