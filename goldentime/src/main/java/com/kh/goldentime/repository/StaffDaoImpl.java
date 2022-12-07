package com.kh.goldentime.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.StaffDto;

@Repository
public class StaffDaoImpl implements StaffDao{

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override//등록
	public void insert(StaffDto staffDto) {
		sqlSession.insert("staff.insert",staffDto);	
	}

	@Override//목록
	public List<StaffDto> list() {
		return sqlSession.selectList("staff.list");
	}


	@Override//수정
	public boolean edit(StaffDto staffDto) {
		int count = sqlSession.update("staff.edit", staffDto);
		return count > 0;
	}

	@Override//삭제
	public boolean delete(String staffId) {
		int count = sqlSession.delete("staff.delete", staffId);
		return count > 0;
	}

	@Override//로그인 여부 확인
	public StaffDto selectOne(String staffId) {
		return sqlSession.selectOne("staff.login",staffId);
		
	}

	@Override//개인정보 변경
	public boolean changeInformation(StaffDto staffDto) {
		int count = sqlSession.update("staff.information", staffDto);
		return count > 0;
	}

	@Override//비밀번호 확인
	public boolean checkPassword(StaffDto staffDto) {
		int count = sqlSession.update("staff.checkPw",staffDto);
		return count > 0;
	}

	@Override//비밀번호 변경
	public boolean changePassword(String staffId, String afterPw) {
		Map<String, String> param = new HashMap<>();
		param.put("staffId", staffId);
		param.put("afterPw", afterPw);
		int count = sqlSession.update("staff.password", param);
		return count>0;
	}
	
	
}