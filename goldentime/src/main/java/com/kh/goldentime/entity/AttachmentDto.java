package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttachmentDto { //첨부파일DTO

	private int attachmentNo;//첨부파일 번호
	private String attachmentName;//첨부파일 이름
	private String attachmentType;//첨부파일 유형
	private Long attachmentSize;//첨부파일 크기
	private Date attachmentDate;//첨부파일 업로드 시간
	
}
