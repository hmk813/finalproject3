package com.kh.goldentime.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
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
		String id = "admin";
		if(attendanceDao.goWorkFind(id)==null) {//만약 출근데이터가 null이면
			//출근 구문 insert
			attendanceDao.goWork(attendanceDto);
		}else {//null값처리
			attendanceDao.goWork(null);
		}
		
		
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
