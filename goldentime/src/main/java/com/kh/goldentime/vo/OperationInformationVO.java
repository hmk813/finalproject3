package com.kh.goldentime.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class OperationInformationVO {
	private int operationNo;
	private int operationDiagnosisNo;
	private int patientNo;
	private Date operationStartDay;
	private Date operationEnd;
	private String operationContent;
	private String operationTitle; 
	private String patientName; 
	private Date patientBirth; 
	private String patientGender;
	private String patientBlood; 
	private String diagnosisStaffId;
	private String diagnosisTitle;
	private Date diagnosisDate;
	private int operationRoomNo;
	private String operationState;
}
