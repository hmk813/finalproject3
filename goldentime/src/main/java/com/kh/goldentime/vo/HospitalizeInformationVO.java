package com.kh.goldentime.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class HospitalizeInformationVO {
	private int hospitalizeNo;
	private int hospitalizePatientNo; 
	private int hospitalizeDiagnosisNo;
	private String hospitalizeStaffid; 
	private int hospitalizeOperationNo;
	private Date hospitalizeStartDate; 
	private Date hospitalizeEndDate;
	private int sickRoomNo;
	private int sickRoomSize;
	private int sickRoomBed;
	private Date operationStartDay;
	private  String operationContent; 
	private String operationTitle; 
	private String diagnosisTitle; 
	private int patientNo; 
	private String patientName; 
	private Date patientBirth; 
	private String patientGender;
	private String patientAddress;
}
