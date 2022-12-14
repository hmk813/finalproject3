package com.kh.goldentime.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.entity.VacationDto;

@Repository
public class CalendarDaoImpl implements CalendarDao	 {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ReservationDto> reservationList() {
		return	 sqlSession.selectList("calendar.reservationList");
	}

	@Override
	public List<AttendanceDto> attendanceList() {
		return sqlSession.selectList("calendar.attendanceList");
	}

	@Override
	public List<VacationDto> vacationList() {
		return sqlSession.selectList("calendar.vacationList");
	}
}
