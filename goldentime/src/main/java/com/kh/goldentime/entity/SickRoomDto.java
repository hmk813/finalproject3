 package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor @Builder @Data @NoArgsConstructor
public class SickRoomDto {
	private int sickRoomNo;
	private int hospitalizsSickRoomNo;
	private int sickRoomSize;
	private String sickRoomState; 
	private int sickRoomBed; 
}
