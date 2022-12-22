package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class PatientReservationListVO {
	private int patientNo, diagnosisNo, reservationNo;
	private String patientName, patientGender, patientBlood;
	private String reservationTime;
	private Date patientBirth;
	private String reservationDate;
}
