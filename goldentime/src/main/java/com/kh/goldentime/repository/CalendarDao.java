package com.kh.goldentime.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.entity.VacationDto;

@Repository
public interface CalendarDao {
	
	//List<ReservationDto> calendarList(String reservationStaffId);

	List<ReservationDto> calendarList(String reservationDate);

	List<ReservationDto> list();
}
