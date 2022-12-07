package com.kh.goldentime;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.entity.StaffDto;

@SpringBootTest
public class moonkyuTest {

	@Autowired
	private SqlSession sqlSession;
	
	@Test
	public void test() {
//		//assertNotNull(sqlSession);
//		List<StaffDto> list = sqlSession.selectList("staff.list");
//		for(StaffDto staffDto : list) {
//			System.out.println(staffDto);
//		}
//	}
	}
}


