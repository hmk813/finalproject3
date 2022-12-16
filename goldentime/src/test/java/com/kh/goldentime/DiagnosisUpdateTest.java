package com.kh.goldentime;

import java.sql.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.entity.DiagnosisDto;

@SpringBootTest
public class DiagnosisUpdateTest {
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		sqlSession.update("diagnosis.edit", DiagnosisDto.builder()
																.diagnosisNo(1)
																.diagnosisContent("늑골이 아픔")
																.diagnosisDate(Date.valueOf("2021-10-05"))
																.diagnosisTitle("늑골 부러짐")
																.diagnosisMemo("키:150, 몸무게:80")
															.build());
	}
}
