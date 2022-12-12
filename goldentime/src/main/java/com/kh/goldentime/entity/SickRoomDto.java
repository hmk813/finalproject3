 package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class SickRoomDto {
	private int sickRoomNo;
	private int sickRoomHospitalizeNo;
	private int sickRoomDiagnosisNo;
	private String sickRoomStaffId; 
	private int sickRoomPatientNo; 
	private int sicrkRoomOperationNo;
	private int sickRoomSize;
	private int sickRoomBed;
}
