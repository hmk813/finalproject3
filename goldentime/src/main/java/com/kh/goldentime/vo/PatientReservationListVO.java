package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class PatientReservationListVO {
	private int patientNo;
	private String patient_name, patientGender, patientBlood,
	patientAddress, patientPhone;
	private Date patientBirth;
	private int reservationNo, reservationPatientNo;
	private String reservationStaffId, reservationContent, reservationTime;
	private Date reservationDate;
}
