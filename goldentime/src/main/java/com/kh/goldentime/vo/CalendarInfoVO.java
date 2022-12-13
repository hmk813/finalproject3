package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//출퇴근 현황, 예약목록, 연차목록 현황을 위한 VO ->이걸 꼭 만들어야할까?
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CalendarInfoVO {

	//출퇴근
	private int attandanceNo; 
	private String attendanceStaffId; 
	private Date attendanceStartTime; 
	private Date attendanceEndTime; 
	private String attendanceWorkState; 
	//예약
	private int reservationNo;
	private String reservationStaffId;
	private int reservationPatientNo;
	private String reservationDate;
	private String reservationContent;
	private String reservationTime;
	//연차
	private int vacationNo;
	private String vacationStaffId;
	private String vacationType;
	private Date vacationStartDate;
	private int vacationDay;
	private String vacationRecode;
	private String vacationState;
	
}
