package com.kh.goldentime.vo;

import java.util.List;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.entity.ReceiveDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ReceiveListVO {
	
	private ReceiveDto receiveDto;
	private List<PatientDto> patientList;

}
