package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.vo.AdminAttendSearchVO;
import com.kh.goldentime.vo.AdminAttendanceVO;

public interface AdminDao {
	//추상 메소드 - 직원들의 출퇴근 현황 목록
	List<AdminAttendanceVO> attendanceList(AdminAttendanceVO adminAttendanceVO);



	List<AdminAttendanceVO> selectSearch(AdminAttendSearchVO adminAttendSearchVO);

	List<AdminAttendanceVO> selectAll(AdminAttendSearchVO adminAttendSearchVO);

	int searchCountFreeboard(AdminAttendSearchVO adminAttendSearchVO);

	int allCountFreeboard();

	int countFreeboard(AdminAttendSearchVO adminAttendSearchVO);

	List<AdminAttendanceVO> searchFreeboard(AdminAttendSearchVO adminAttendSearchVO);
}
