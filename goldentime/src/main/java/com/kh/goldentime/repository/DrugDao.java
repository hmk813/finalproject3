package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.DrugDto;

public interface DrugDao {
	void insert(DrugDto dto);
	List<DrugDto> list();
	boolean edit(DrugDto dto);
}
