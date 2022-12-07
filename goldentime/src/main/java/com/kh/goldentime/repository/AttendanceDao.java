package com.kh.goldentime.repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.vo.AttendanceWorkTimeVO;
import com.kh.goldentime.vo.TimeFormatVO;
import com.kh.goldentime.vo.TodayTotalWorkTimeVO;

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
	TodayTotalWorkTimeVO todayTimeWork(String attendanceStaffId);
	
	
	//추상 메소드- 오늘 퇴근시간 조회
	TimeFormatVO todayLeaveTime(String attendanceStaffId);
	
	//추상 메소드 - 오늘 조퇴 업데이트
	boolean leaveEarly(String attendanceStaffId);
	
	//추상 메소드 - 오늘 정상출근 업데이트
	boolean normalWork(String attendanceStaffId);
}
