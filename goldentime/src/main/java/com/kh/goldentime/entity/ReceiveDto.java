package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReceiveDto {
	private int receiveNo, patientNo;
	private String staffId, receiveDate, receiveTime;
}
