package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.repository.ReservationDao;
import com.kh.goldentime.vo.ReservationDateStaffIdVO;

@CrossOrigin
@RequestMapping("/rest")
@RestController
public class ReservationRestController {

	@Autowired
	private ReservationDao reservationDao;
	
	@PostMapping("/reservation")
	public void insert(@RequestBody ReservationDto reservationDto) {
		reservationDao.insert(reservationDto);
	}
	
	@GetMapping("/reservation")
	public List<ReservationDto> list(){
		return reservationDao.list();
	}
	
	@GetMapping("/reservation/{reservationDate}")
	public List<ReservationDto> dateList(@PathVariable String reservationDate){
		return reservationDao.dateList(reservationDate);
	}
	
	@GetMapping("/reservation/vo")
	public List<ReservationDto> dateStaffList(@ModelAttribute  ReservationDateStaffIdVO reservationDateStaffIdVO){
		return reservationDao.reservationConfirm(reservationDateStaffIdVO);
	}
	
	@DeleteMapping("/reservation/{reservationNo}")
	public boolean delete(@PathVariable int reservationNo) {
		return reservationDao.delete(reservationNo);
	}
	
}





