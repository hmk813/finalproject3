package com.kh.goldentime.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.entity.VacationDto;

@Repository
public interface CalendarDao {
	
	//예약목록
	List<ReservationDto> reservationList();

	//출퇴근목록
	List<AttendanceDto> attendanceList();

	//연차목록
	List<VacationDto> vacationList();
}
