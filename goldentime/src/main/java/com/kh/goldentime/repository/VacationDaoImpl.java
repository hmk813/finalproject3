package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.vo.VacationStaffVO;

@Repository
public class VacationDaoImpl implements VacationDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<VacationStaffVO> list(String VacationStaffId) {
		return sqlSession.selectList("vacation.list",VacationStaffId);
	}

	@Override
	public boolean newYearUpdate() {
		return sqlSession.update("vacation.newYearUpdate")>0;
	}
	
}