package com.kh.goldentime.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class HosptalizeDto {
	private int hosptalizeNo;
	private int hosptalizeDiagnosisNo;
	private String hosptalizeStaffId;
	private int hosptalizeOperationNo;
	private int hosptalizePatientNo; 
	private Date hosptalizeStartDate; 
	private Date hosptalizeEndDate;
}
