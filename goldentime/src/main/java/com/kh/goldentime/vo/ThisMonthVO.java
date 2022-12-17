package com.kh.goldentime.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
//이번달 출근 현황
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ThisMonthVO {
	private String attendanceWorkState;
	private int day;
}
