package com.kh.goldentime.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AdminAttendanceAllVO {
	private String dapartmentName;
	private String staffName;
	private String staffGrade;
	private String staffMedicalDepartment;
	private String staffId;
	private String attendanceStartTime;
	private String startTime;
	private String endTime;
	private String attendanceWorkState;
	private int workTime;
	private String attendanceStaffId;
}
