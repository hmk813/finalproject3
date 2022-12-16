package com.kh.goldentime.entity;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class StaffDto {

		private String staffId;//아이디
		private int staffDepartmentNo;//부서번호
		private Date staffBirth;//생년월일
		private String staffPhone;//전화번호
		private String staffAddress;//주소
		private Date staffEnrollDate;//입사일
		private Date staffLeaveDate;//퇴사일
		private String staffState;//계정상태( Y / F )
		private String staffPw;//비밀번호
		private String staffGrade;//등급
		private String staffMedicalDepartment;//진료과
		private String staffName;//이름
		private int staffLeaveCnt;//연차수
		private int staffDayoff;//월차수

}
