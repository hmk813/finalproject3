package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.error.TargetNotFoundException;
import com.kh.goldentime.vo.OperationInformationVO;

@Repository
public class OperationDaoImpl implements OperationDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<OperationInformationVO> selectList() {
		return sqlSession.selectList("operation.list");
	}
	
//	@Override
//	public OperationInformationVO selectOne(int operationNo) {
//		return sqlSession.selectOne("operation.one",operationNo);
//	}
	
	@Override
	public OperationInformationVO selectOne(int patientNo) {
		return sqlSession.selectOne("operation.one",patientNo);
	}
	

}
