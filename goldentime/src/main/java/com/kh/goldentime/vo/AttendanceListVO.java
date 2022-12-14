package com.kh.goldentime.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//출퇴근 현황을 위한 VO
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttendanceListVO {
	private String attendanceStartTime;
	private String startTime;
	private String endTime;
	private String attendanceWorkState;
	private int workTime;
	private String attendanceStaffId;
	private String beginMade, endMade;
	

}
