package com.kh.goldentime.vo;
import java.util.Date;

//서버에서 소통하기 위한 VO
//개조용도로 만든 class
//DB에 들어가진 않지만 데이터를 모아서 받아야 함
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties//데이터가 없어도 변환
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MessageVO {
	private String text;//보내는 정보
	private Date time;//서버가 추가할 정보
}
