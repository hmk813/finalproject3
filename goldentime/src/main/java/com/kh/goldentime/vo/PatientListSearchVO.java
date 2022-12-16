package com.kh.goldentime.vo;

import lombok.Data;

@Data 
public class PatientListSearchVO {
	private String type, keyword;
	
	public boolean isSearch() {
		return type != null && keyword != null;
	}

}
