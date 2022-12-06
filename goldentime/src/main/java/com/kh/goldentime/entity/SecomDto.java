package com.kh.goldentime.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class SecomDto {//암호화를 위한 Dto

	private String staffId, staffPw;
}
