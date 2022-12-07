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
import com.kh.goldentime.vo.AttendanceWorkTimeVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@RestController
public class AttendanceRestController {//근태 관리를 위한 비동기통신 controller
	
	@Autowired
	AttendanceDao attendanceDao;
	
	
	//출근 등록 구문(post)
	@PostMapping("/attendance")
	public String goWork(@RequestBody AttendanceDto attendanceDto) {
		String id = "admin1";
		if(attendanceDao.goWorkFind(id)==null) {//만약 출근데이터가 null이면
			//출근 구문 insert
			attendanceDao.goWork(attendanceDto);
			
			if(attendanceDao.comeLate(id)!=null) {//만약 지각조회를 했는데 8시 30뷴 넘은 데이터가 있으면 지각
				attendanceDao.comeLateUpate(id);
				return "late";
			}else {
				return "good";
			}
			
		}else {//null값처리
			return "n";
		}
		
		
	}
	
	//퇴근 등록 구문(put)
	@PutMapping("/attendance")
	public boolean leaveWork(@RequestBody AttendanceDto attendanceDto){
		//8시간 이상이라면
		//8시간 이하라면
		return attendanceDao.leaveWork(attendanceDto);
	}
	
	
	@GetMapping("/attendance/{attendanceStaffId}")
	public AttendanceWorkTimeVO find(@PathVariable String attendanceStaffId){
		attendanceStaffId = "admin1";
		return attendanceDao.stardEnd(attendanceStaffId);
	}
}
