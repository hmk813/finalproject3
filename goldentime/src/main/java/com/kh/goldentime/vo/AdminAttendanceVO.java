package com.kh.goldentime.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//관리자 페이지에서 직원의 출퇴근 목록 테이블을 위한 VO
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AdminAttendanceVO {
	private String dapartmentName;
	private String staffName;
	private String staffGrade;
	private String staffMedicalDepartment;
	private String staffId;
	private String attendanceStartTime;
	private String startTime;
	private String endTime;
	private String attendanceWorkState;
	private int workTime;
	private String attendanceStaffId;
	
	//검색을 위한 변수 설정
	private List<String> type;
	private List<String> sort;
	private String beginMade, endMade;
}
