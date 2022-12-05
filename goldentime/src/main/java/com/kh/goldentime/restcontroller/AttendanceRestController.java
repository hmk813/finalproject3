package com.kh.goldentime.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.AttendanceDto;
import com.kh.goldentime.repository.AttendanceDao;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@RestController
public class AttendanceRestController {//근태 관리를 위한 비동기통신 controller
	
	@Autowired
	AttendanceDao attendanceDao;
	
	@PostMapping("/attendance")
	public void goWork(@RequestBody AttendanceDto attendanceDto) {
		attendanceDao.goWork(attendanceDto);
	}
	
	@PutMapping("/attendance")
	public boolean leaveWork(@RequestBody AttendanceDto attendanceDto){
		return attendanceDao.leaveWork(attendanceDto);
	}
	
//	@GetMapping("/pocketmon/{attendanceStaffId}")
//	public AttendanceDto find(@PathVariable String attendanceStaffId){
//		
//		return attendanceDao.goWorkFind();
//	}
}
