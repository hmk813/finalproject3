package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.DrugDto;

@Repository
public class DrugDaoImpl implements DrugDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(DrugDto dto) {
		sqlSession.insert("drug.insert", dto);
	}
	
	@Override
	public List<DrugDto> list() {
		return sqlSession.selectList("drug.list");
	}
	
	@Override
	public boolean edit(DrugDto dto) {
		int count = sqlSession.update("drug.edit", dto);
		return count > 0;
	}
}
