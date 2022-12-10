package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class VacationDto {
	private int vacationNo;
	private String vacationStaffId;
	private String vacationType;
	private Date vacationStartDate;
	private int vacationDay;
	private String vacationRecode;
	private String vacationState;
}
