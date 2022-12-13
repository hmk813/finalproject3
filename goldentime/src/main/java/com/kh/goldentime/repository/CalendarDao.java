package com.kh.goldentime.repository;

import com.kh.goldentime.entity.CalendarDto;

public interface CalendarDao {

	//캘린더 등록
	void insertCalendar(CalendarDto calendarDto);
	
}
