package com.kh.goldentime.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao	 {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertCalendar(CalendarDto calendarDto) {
		sqlSession.insert("calendar.insert", calendarDto);
		
		
	}

}
