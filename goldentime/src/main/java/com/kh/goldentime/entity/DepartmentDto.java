package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @NoArgsConstructor @AllArgsConstructor @Builder @ToString
public class DepartmentDto {

	private int departmentNo;//부서번호
	private String departmentName;//부서 이름
}
