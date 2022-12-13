package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class CalendarDto {

		private int calendarNo;
		private String calendarStaffId;
		private String calendarTitle;
		private String calendarContent;
		private Date calendarRegiDate;
		private Date calendarStartTime;
		private Date calendarEndTime;
		private String alldayState;
		private String calendarState;
		private String calendarDepartment;
}
