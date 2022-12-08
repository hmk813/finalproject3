package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.ReservationDto;

@Repository
public class ReservationDaoImpl implements ReservationDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(ReservationDto reservationDto) {
		
		
	}

}
