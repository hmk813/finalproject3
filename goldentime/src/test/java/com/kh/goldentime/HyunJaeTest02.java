package com.kh.goldentime;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.repository.VacationDao;
import com.kh.goldentime.vo.VacationStaffVO;

@SpringBootTest
public class HyunJaeTest02 {

	@Autowired
	VacationDao vacationDao;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void test01() {
		String id = "test2";

		List<VacationStaffVO> list = vacationDao.list(id);
		System.out.println(list.size());
		for(VacationStaffVO dto : list) {
			System.out.println(dto);
		}
		
		SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");
		Date date = new Date(System.currentTimeMillis());

		
//		sqlSession.insert("vacation.enroll",VacationDto.builder()
//				.vacationStaffId(id)
//				.vacationType("연차")
//				.vacationDay(2)
//				.vacationRecode("테스트111")
//				.build());
		
//		VacationDto dto = VacationDto.builder()
//				.vacationStaffId("admin")
//				.vacationType("연차")
//				.vacationDay(2)
//				.vacationStartDate(date)
//				.vacationRecode("테스트입력")
//				.build();
//		vacationDao.enroll(dto);
//		System.out.println("ssss"+dto);
		
//		vacationDao.newYearUpdate();
		
	}
}
