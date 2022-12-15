package com.kh.goldentime.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class PatientReceiveListVO {//접수 페이지에서 환자 기본 정보 목록에 보이게
	private int patientNo;
	private String patient_name, patientGender, patientBlood,
	patientAddress, patientPhone;
	private Date patientBirth;
	private int receiveNo;
	private String staffId, receiveDate, receiveTime;
}