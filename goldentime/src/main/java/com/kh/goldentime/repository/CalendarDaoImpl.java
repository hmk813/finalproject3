package com.kh.goldentime.repository;
import java.util.List;




import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.ReservationDto;

@Repository
public class CalendarDaoImpl implements CalendarDao	 {

	@Autowired
	private SqlSession sqlSession;

//	@Override
//	public List<ReservationDto> calendarList(String reservationStaffId) {
//		return sqlSession.selectList("calendar.calendarList",reservationStaffId);
//	}

	@Override
	public List<ReservationDto> list() {
		return sqlSession.selectList("calendar.list");
	}

	@Override
	public List<ReservationDto> calendarList(String reservationDate) {
		return sqlSession.selectList("calendar.calendarList", reservationDate);
	}

}