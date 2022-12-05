package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PatientDto {
	private int patientNo;
	private Date patientBirth;
	private String patientName, patientGender, patientPhone,
	patientAddress, patientBlood; 
}
