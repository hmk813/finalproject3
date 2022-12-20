package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PatientReservationDepartmentVO {
	private int patientNo, receiveNo;
	private String patientName, patientGender, patientBlood;
	private Date patientBirth;
	private String reservationDate;
	private String reservationTime;
	private String reservationStaffId;
	private String staffMedicalDepartment;
}
