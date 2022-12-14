package com.kh.goldentime.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class ReceiveVO {
	private int receiveNo, patientNo;
	private String staffId, receiveDate, receiveTime;
}
