package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.repository.AttendanceDao;
import com.kh.goldentime.repository.CalendarDao;
import com.kh.goldentime.repository.ReservationDao;
import com.kh.goldentime.repository.VacationDao;
import com.kh.goldentime.vo.AttendanceListVO;
import com.kh.goldentime.vo.VacationStaffVO;

@CrossOrigin
@RequestMapping("/rest")
@RestController
public class CalendarRestController {

	@Autowired
	private CalendarDao calendarDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Autowired
	private VacationDao vacationDao;
	
//	@GetMapping("/reservationList")
//	public List<ReservationDto> reservationList(){
//		return reservationDao.list();
//	}
//	
////	@GetMapping("/attendanceList")
////	public List<AttendanceListVO> attendanceList(){
////		return attendanceDao.attendanceList();
////	}
//	
//	@GetMapping("/vacationList")
//	public List<VacationStaffVO> vacationList(String VacationStaffId){
//		return vacationDao.list(VacationStaffId);
//	}
//}

}