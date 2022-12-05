package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttendanceDto;

public interface AttendanceDao {
	//추상메소드 - 출근기능
	void goWork(AttendanceDto attendanceDto);
	//추상메소드 - 퇴근기능
	boolean leaveWork(AttendanceDto attendanceDto);
	//추상메소드 - 해당아이디 오늘출근 조회기능
	AttendanceDto goWorkFind(String attendanceStaffId);
}
