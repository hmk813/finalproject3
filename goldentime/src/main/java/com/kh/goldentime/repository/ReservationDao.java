package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.ReservationDto;

public interface ReservationDao {
	
	void insert(ReservationDto reservationDto);
	
	List<ReservationDto> dateList(String reservationDate);

	List<ReservationDto> list();
	
	boolean delete(int reservationNo);

}
