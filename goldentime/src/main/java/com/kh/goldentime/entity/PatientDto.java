package com.kh.goldentime.entity;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties
@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PatientDto {
	private int patientNo;
	private Date patientBirth;
	private String patientName, patientGender, patientPhone,
	patientAddress, patientBlood; 
}
