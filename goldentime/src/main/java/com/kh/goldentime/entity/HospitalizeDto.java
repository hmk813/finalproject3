package com.kh.goldentime.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class HospitalizeDto {
	private int hospitalizeNo;
	private int hospitalizeDiagnosisNo;
	private String hospitalizeStaffId;
	private int hospitalizeOperationNo;
	private int hosptializePatientNo; 
	private Date hosptializeStartDate; 
	private Date hosptializeEndDate;
}
