package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.StaffDto;

public interface StaffDao {

	void insert(StaffDto staffDto); //등록
	List<StaffDto> list(); //목록
	boolean edit(StaffDto staffDto);//수정
	boolean delete(String staffId);//삭제
	
	StaffDto selectOne(String staffId, String staffPw);
	StaffDto selectOne(String loginId);
	
	
}