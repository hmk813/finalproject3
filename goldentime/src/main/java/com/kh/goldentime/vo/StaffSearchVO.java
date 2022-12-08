package com.kh.goldentime.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class StaffSearchVO { 
	
	//직원 검색을 위한 VO
	private String staffName;
	private String staffMedicalDepartment;
	private int staffDepartmentNo;

}
