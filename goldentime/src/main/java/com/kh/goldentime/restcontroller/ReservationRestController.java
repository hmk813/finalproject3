package com.kh.goldentime.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.repository.ReservationDao;

@CrossOrigin(origins = "http://127.0.0.1:5501")
@RequestMapping("/rest")
@RestController
public class ReservationRestController {

	@Autowired
	private ReservationDao reservationDao;
	
	@PostMapping("reservation")
	public void insert(@RequestBody ReservationDto reservationDto) {
		reservationDao.insert(reservationDto);
	}
}
