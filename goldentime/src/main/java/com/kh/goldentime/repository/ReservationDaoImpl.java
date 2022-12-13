package com.kh.goldentime.repository;

import java.util.List;

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
		sqlSession.insert("reservation.insert", reservationDto);
		
	}

	@Override
	public List<ReservationDto> list() {
		return sqlSession.selectList("reservation.list");
	}

	@Override
	public List<ReservationDto> dateList(String reservationDate) {
		return sqlSession.selectList("reservation.dateList", reservationDate);
	}

	@Override
	public boolean delete(int reservationNo) {
		int count = sqlSession.delete("reservation.delete", reservationNo);
		return count > 0;
	}

}
