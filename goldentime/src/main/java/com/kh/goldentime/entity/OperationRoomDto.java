package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class OperationRoomDto {
	private int operationRoomNo;
	private int operationOriginNo;
	private String operationState; 
	

}
