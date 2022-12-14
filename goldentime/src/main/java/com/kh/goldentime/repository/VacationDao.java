package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.VacationDto;
import com.kh.goldentime.vo.VacationStaffVO;

public interface VacationDao {
	
	//추상 메소드 - 직원 휴가 조회목록
	List<VacationStaffVO>  list(String VacationStaffId);
	
	//추상 메소드 - 직원 연차 13개 업데이트 구문
	boolean newYearUpdate();
	
	//추상 메소드 - 직원 휴가 신청구문
	void enroll(VacationDto vacationDto);
	
	//추상 메소드 - 직원 휴가 수정구문
	boolean edit(VacationDto vacationDto);
}
