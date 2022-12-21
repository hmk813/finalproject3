package com.kh.goldentime.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AdminVacationVO {
	private int vacationNo;
	private String vacationStaffId;
	private String vacationType;
	private String vacationStartDate;
	private int vacationDay;
	private String vacationRecode;
	private String vacationState;
	private String staffGrade;
	private int staffDepartmentNo;
	private int staffLeaveCnt;
	private String departmentName;
	private String staffName;
	private String staffMedicalDepartment;
	private int staffDayoff;
	private int useleave;
	private int usedayoff;
	
	//검색을 위한 변수 설정
	private List<String> type;
	private List<String> sort;
	private String beginMade, endMade;
}
