package com.kh.goldentime;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.repository.VacationDao;
import com.kh.goldentime.vo.VacationStaffVO;

@SpringBootTest
public class HyunJaeTest02 {

	@Autowired
	VacationDao vacationDao;
	
	@Test
	public void test01() {
		String id = "aaa";

		List<VacationStaffVO> list = vacationDao.list(id);
		System.out.println(list.size());
		for(VacationStaffVO dto : list) {
			System.out.println(dto);
		}
		
//		vacationDao.newYearUpdate();
		
	}
}
