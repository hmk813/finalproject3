package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DiagnosisDto {
	private Date diagnosisDate;
	private int diagnosisNo, diagnosisPatientNo;
	private String diagnosisStaffId, diagnosisContent, diagnosisTitle;

}
