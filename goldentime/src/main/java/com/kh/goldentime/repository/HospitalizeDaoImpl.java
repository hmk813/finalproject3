package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.vo.HospitalizeInformationVO;

@Repository
public class HospitalizeDaoImpl implements HospitalizeDao{

	@Autowired
	private SqlSession sqlSession; 
	
	@Override
	public List<HospitalizeInformationVO> selectList() {
		return sqlSession.selectList("hospitalize.list");
	}
}
