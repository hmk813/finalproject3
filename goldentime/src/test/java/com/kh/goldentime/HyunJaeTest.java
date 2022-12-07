package com.kh.goldentime;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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
		String id = "admin1";
		
//		System.out.println(attendanceDao.goWorkFind(id));
//		System.out.println(attendanceDao.comeLate(id));
//		System.out.println(attendanceDao.todayTimeWork(id).getWorkTime()==13);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String date = LocalDate.now().atStartOfDay().plusHours(18).plusMinutes(30).format(formatter);
		LocalDateTime date1 = LocalDateTime.parse(date,formatter);
		System.out.println(date);
		String todayLeave=attendanceDao.todayLeaveTime(id).getTime();
		LocalDateTime today1 = LocalDateTime.parse(todayLeave,formatter);
		System.out.println(todayLeave);
//		isBefore() : 인자보다 과거일 때 true가 리턴
//		isAfter() : 인자보다 미래일 때 true가 리턴
//		isEqual() : 인자와 같은 시간일 때 true가 리턴
		if(date1.isAfter(today1)) {
			System.out.println("조퇴");
		}
		
		
		
		
		
	}
}
