package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.StaffDto;

public interface StaffDao {

	void insert(StaffDto staffDto); //등록
	List<StaffDto> list(); //목록
	boolean edit(StaffDto staffDto);//수정
	boolean delete(String staffId);//삭제

	StaffDto selectOne(String staffId);//로그인 여부
	
	boolean changePassword(String staffId, String staffPw);//비밀번호 변경
	
	boolean changeInformation(StaffDto staffDto);//개인정보 변경

	
}