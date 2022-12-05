package com.kh.goldentime;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.repository.AttendanceDao;

@SpringBootTest
public class HyunJaeTest {

	@Autowired
	AttendanceDao attendanceDao;
	
	@Test
	public void test01() {
//		attendanceDao.goWork(AttendanceDto.builder()
//				.attendanceStaffId("aaa")
//				.build());
		
		
	}
}
