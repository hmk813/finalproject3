package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.vo.AdminAttendanceVO;
import com.kh.goldentime.vo.AdminVacationVO;
import com.kh.goldentime.vo.VacationStaffVO;

public interface AdminDao {
	//추상 메소드 - 직원들의 출퇴근 현황 목록
	List<AdminAttendanceVO> attendanceList(AdminAttendanceVO adminAttendanceVO);
	
	
	//추상메소드 - 직원 휴가 목록
	List<VacationStaffVO>  list();
	
	//추상 메소드 - 직원 휴가 승인 변경처리
	boolean approve(int vacationNo);
	
	//추상 메소드 - 직원 휴가 반려 변경처리
	boolean refuse(int vacationNo);
	
	//추상 메소드 - 검색어를 위한 리스트
	List<AdminVacationVO> search(AdminVacationVO adminVacationVO);
}
