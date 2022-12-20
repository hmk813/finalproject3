package com.kh.goldentime.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class PatientPhoneNameVO {
	private String patientName;
	private String patientPhone;

}
