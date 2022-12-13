package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReservationDto {
	private int reservationNo;
	private String reservationStaffId;
	private int reservationPatientNo;
	private String reservationDate;
	private String reservationContent;
	private String reservationTime;
}
