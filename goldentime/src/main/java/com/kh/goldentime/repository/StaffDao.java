package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.StaffDto;

public interface StaffDao {

	void insert(StaffDto staffDto); //등록
	List<StaffDto> list(); //목록
	StaffDto selectOne(String staffId);//단일조회
	boolean edit(StaffDto staffDto);//수정
	boolean delete(String staffId);//삭제
}
