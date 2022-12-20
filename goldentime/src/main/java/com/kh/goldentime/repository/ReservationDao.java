package com.kh.goldentime.repository;

import java.util.List;

import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.vo.PatientReservationDepartmentVO;
import com.kh.goldentime.vo.PatientReservationListVO;
import com.kh.goldentime.vo.ReservationDateStaffIdVO;

public interface ReservationDao {
	
	void insert(ReservationDto reservationDto);
	
	List<ReservationDto> dateList(String reservationDate);
	
	List<ReservationDto> reservationConfirm(ReservationDateStaffIdVO reservationDateStaffIdVO);

	List<ReservationDto> list();
	
	ReservationDto reservationDetail(int reservationNo);
	
	List<PatientReservationListVO> todayList();
	
	List<PatientReservationDepartmentVO> toDayListSurgery();
	
	List<PatientReservationDepartmentVO> toDayListMedicine();
	
	List<PatientReservationDepartmentVO> toDayListOrthopedic();
	
	List<PatientReservationDepartmentVO> toDayListRadiology();
	
	boolean delete(int reservationNo);

}
