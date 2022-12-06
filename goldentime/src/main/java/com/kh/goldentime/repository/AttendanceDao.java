package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.vo.AttendanceTotalWorkTimeVO;
import com.kh.goldentime.vo.AttendanceWorkTimeVO;

public interface AttendanceDao {
	
	//추상메소드 - 출근기능
	void goWork(AttendanceDto attendanceDto);
	
	//추상메소드 - 퇴근기능
	boolean leaveWork(AttendanceDto attendanceDto);
	
	//추상메소드 - 해당아이디 오늘출근 조회기능
	AttendanceDto goWorkFind(String attendanceStaffId);
	
	//추상메소드 - 해당아이디 오늘출근 퇴근 시간조회기능
	AttendanceWorkTimeVO stardEnd(String attendanceStaffId);
	
	//추상메소드 - 해당아이디 오늘지각 조회기능
	AttendanceDto comeLate(String attendanceStaffId);
	
	//추상메소드 - 출근시 지각 처리기능
	boolean comeLateUpate(String attendanceStaffId);
	
	//추상메소드 - 금일 근무 시간 정보 조회기능
	AttendanceTotalWorkTimeVO todayTimeWork(String attendanceStaffId);
}
