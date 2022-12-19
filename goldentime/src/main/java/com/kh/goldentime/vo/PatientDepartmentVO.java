package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class PatientDepartmentVO {
	private int patientNo;
	private String patientName, patientGender, patientBlood;
	private Date patientBirth;
	private String receiveDate;
	private String staffId;
	private String staffMedicalDepartment;

}
