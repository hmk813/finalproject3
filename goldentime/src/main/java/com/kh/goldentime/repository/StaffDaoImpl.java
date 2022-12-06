package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.StaffDto;

@Repository
public class StaffDaoImpl implements StaffDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(StaffDto staffDto) {
		sqlSession.insert("staff.insert",staffDto);	
	}

	@Override
	public List<StaffDto> list() {
		return sqlSession.selectList("staff.list");
	}

	@Override
	public StaffDto selectOne(String staffId) {
		return sqlSession.selectOne("staff.find", staffId);
	}

	@Override
	public boolean edit(StaffDto staffDto) {
		int count = sqlSession.update("staff.edit", staffDto);
		return count > 0;
	}

	@Override
	public boolean delete(String staffId) {
		int count = sqlSession.delete("staff.delete", staffId);
		return count > 0;
	}

	@Override
	public String login(StaffDto staffDto) {
		return sqlSession.selectOne("staff.login",staffDto);
	}

	@Override
	public boolean changePassword(String staffId, String staffPw) {
		return sqlSession.selectOne(staffId);
	}

}
