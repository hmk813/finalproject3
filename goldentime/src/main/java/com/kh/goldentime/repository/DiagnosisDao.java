package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.DiagnosisDto;

public interface DiagnosisDao {
	List<DiagnosisDto> list();
	boolean edit(DiagnosisDto dto);
}
