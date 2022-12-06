package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//출근시간과 퇴근시간을 비교하는 컬럼 추가
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttendanceTotalWorkTimeVO {
	private int attandanceNo; 
	private String attendanceStaffId; 
	private Date attendanceStartTime; 
	private Date attendanceEndTime; 
	private String attendanceWorkState; 
	private int workTime;
}
