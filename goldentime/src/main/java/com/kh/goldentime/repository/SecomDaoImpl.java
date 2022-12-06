package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.kh.goldentime.entity.SecomDto;

public class SecomDaoImpl implements SecomDao {

	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private PasswordEncoder encoder;

	@Override
	public void join(SecomDto secomDto) {
		String staffPw = secomDto.getStaffPw();
		String enc = encoder.encode(staffPw);
		secomDto.setStaffPw(enc);
		sqlSession.insert("secom.join",secomDto);
		
	}

	@Override
	public boolean login(SecomDto secomDto) {
		SecomDto findDto = sqlSession.selectOne("secom.get",secomDto.getStaffId());
		if(findDto == null) return false;
		boolean judge = encoder.matches(secomDto.getStaffPw(), findDto.getStaffPw());
		return judge;
	}

	@Override
	public SecomDto find(String staffId) {
		return sqlSession.selectOne("secom.get", staffId);
	}
	
	
}
