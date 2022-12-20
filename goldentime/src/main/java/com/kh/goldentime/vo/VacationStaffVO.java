package com.kh.goldentime.vo;

import java.sql.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
//vacation_staff_view VO 클래스
public class VacationStaffVO {
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
	
	private String keyword;
	private String type;
	
}
