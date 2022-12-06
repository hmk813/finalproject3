package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.StaffImgDto;

public interface StaffImgDao {

	//직원이미지 등록
	void insert(StaffImgDto staffImgDto);
	
	//직원이미지 목록
	List<StaffImgDto> list();
	
}
