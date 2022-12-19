package com.kh.goldentime.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.ReservationDto;

@Repository
public interface CalendarDao {
	
	//List<ReservationDto> calendarList(String reservationStaffId);
	
	List<ReservationDto> calendarList(String reservationDate);
	
	List<ReservationDto> list();
}
