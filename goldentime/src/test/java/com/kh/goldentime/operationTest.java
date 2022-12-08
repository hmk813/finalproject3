package com.kh.goldentime;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.goldentime.vo.OperationInformationVO;

@SpringBootTest
public class operationTest {

	
	@Autowired
	private SqlSession sqlSession;
	
// 목록 조회 SelectList()	
	@Test
	public void test() {
		List<OperationInformationVO> list = sqlSession.selectList("operation.list");
		System.out.println(list);
	}
	
}

