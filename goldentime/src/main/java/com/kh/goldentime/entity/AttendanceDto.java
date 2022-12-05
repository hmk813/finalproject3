package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttendanceDto {
	private int attandanceNo; 
	private String attendanceStaffId; 
	private Date attendanceStartTime; 
	private Date attendanceEndTime; 
	private String attendanceWorkState; 
}
