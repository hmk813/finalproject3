package com.kh.goldentime.repository;

import com.kh.goldentime.entity.SecomDto;

public interface SecomDao { //암호화를 위한 DAO

	void join(SecomDto secomDto);
	boolean login(SecomDto secomDto);
	SecomDto find(String staffId);
	
}
