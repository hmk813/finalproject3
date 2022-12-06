package com.kh.goldentime.vo;

import java.sql.Date;

import com.kh.goldentime.entity.AttachmentDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//출퇴근 시간출력을 위한  vo
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttendanceWorkTimeVO {
	private String startTime;
	private String endTime;
}
