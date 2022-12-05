package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttendanceDto;

public interface AttendanceDao {
	
	//추상메소드 - 출근기능
	void goWork(AttendanceDto attendanceDto);
	boolean leaveWork(AttendanceDto attendanceDto);
	AttendanceDto goWorkFind(String attendanceStaffId);
}
