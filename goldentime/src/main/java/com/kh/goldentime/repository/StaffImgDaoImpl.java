package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.StaffImgDto;

@Repository
public class StaffImgDaoImpl implements StaffImgDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(StaffImgDto staffImgDto) {
		sqlSession.insert("staffImg.insert",staffImgDto);
		
	}

	@Override
	public List<StaffImgDto> list() {
		return sqlSession.selectList("stffImg.list");
	}
	
	
}
