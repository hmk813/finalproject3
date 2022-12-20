package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.VacationDto;
import com.kh.goldentime.vo.AdminAttendSearchVO;
import com.kh.goldentime.vo.AdminAttendanceVO;
import com.kh.goldentime.vo.VacationStaffVO;

public interface AdminDao {
	//추상 메소드 - 직원들의 출퇴근 현황 목록
	List<AdminAttendanceVO> attendanceList(AdminAttendanceVO adminAttendanceVO);
	
	List<AdminAttendanceVO> selectSearch(AdminAttendSearchVO adminAttendSearchVO);

	List<AdminAttendanceVO> selectAll(AdminAttendSearchVO adminAttendSearchVO);

	int searchCountFreeboard(AdminAttendSearchVO adminAttendSearchVO);

	int allCountFreeboard();

	int countFreeboard(AdminAttendSearchVO adminAttendSearchVO);

	List<AdminAttendanceVO> searchFreeboard(AdminAttendSearchVO adminAttendSearchVO);
	
	//추상메소드 - 직원 휴가 목록
	List<VacationStaffVO>  list(VacationStaffVO vacationStaffVO);
	
	//추상 메소드 - 직원 휴가 승인 변경처리
	boolean approve(int vacationNo);

	boolean refuse(int vacationNo);
}
