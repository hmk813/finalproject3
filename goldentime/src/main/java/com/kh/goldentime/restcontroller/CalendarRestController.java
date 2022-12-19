package com.kh.goldentime.restcontroller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.repository.CalendarDao;

@CrossOrigin
@RequestMapping("/rest")
@RestController
public class CalendarRestController {
	@Autowired
	private CalendarDao calendarDao;
	
	@GetMapping("/calendar")
	public List<ReservationDto> list(){
		return calendarDao.list();
	}

	@GetMapping("/calendar/{reservationDate}")
	public List<ReservationDto> calendarList(@PathVariable String reservationDate){
		return calendarDao.calendarList(reservationDate);
	}
}