package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class HospitalizeDto {
	private int hospitalizeNo;
	private int hospitalizeDiagnosisNo;
	private String hospitalizeStaffId;
	private int hospitalizePatientNo;
	private Date hospitalizeStartDate;
	private Date hospitalizeEndDate;
	private String patientGuardianName;
	private String patientGuardianPhone;
	private String attendingPhysician; 
	private String hospitalizeCare;
	private String itemPaymentHistory; 
	private String hospitalizeUniqueness;
}
