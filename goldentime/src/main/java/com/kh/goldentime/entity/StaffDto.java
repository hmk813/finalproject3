package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StaffDto {

		private String staffId;
		private int staffDepartmentNo;
		private Date staffBirth;
		private String staffPhone;
		private String staffAddress;
		private Date staffEnrollDate;
		private Date staffLeaveDate;
		private String staffState;
		private String staffPw;
		private String staffGrade;
		private String staffName;
		private int staffLeaveCnt;
		private int staffDayoff;
}
