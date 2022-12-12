package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.vo.VacationStaffVO;

public interface VacationDao {
	
	//추상 메소드 - 직원 휴가 조회목록
	List<VacationStaffVO>  list(String VacationStaffId);
	
	//추상 메소드 - 직원 연차 13개 업데이트 구문
	boolean newYearUpdate();
}
