package com.kh.goldentime;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.entity.PatientDto;

@SpringBootTest
public class PatientInsertTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		//assertNotNull(sqlSession);
		PatientDto patientDto = PatientDto.builder()
													.patientName("김병원")
													.patientBirth(Date.valueOf("1952-08-20"))
													.patientBlood("AB+")
													.patientGender("M")
													.patientAddress("서울특별시 강서구 어쩌로 107동 202호")
													.patientPhone("01011111111")	
											.build();
		sqlSession.insert("patient.add", patientDto);
	}
}
