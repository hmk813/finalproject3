package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class PatientReservationListVO {
	private int patientNo;
	private String patientName, patientGender, patientBlood;
	private String reservationStaffId, reservationTime;
	private String reservationDate;
}
