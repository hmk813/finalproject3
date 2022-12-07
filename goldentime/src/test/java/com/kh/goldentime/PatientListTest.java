package com.kh.goldentime;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.entity.PatientDto;

@SpringBootTest
public class PatientListTest {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
		List<PatientDto> list = sqlSession.selectList("patient.listt");
		for(PatientDto patientDto : list) {
			System.out.println(patientDto);
		}
	}
}
