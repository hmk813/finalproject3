package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data  @NoArgsConstructor
public class OperationDto {
	private int operationNo;
	private int operationDiagnosisNo; 
	private Date operationStartDay; 
	private Date operationEnd;
	private String operationContent; 
	private String operationTitle; 
}
