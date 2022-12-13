package com.kh.goldentime.restcontroller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
		String id = "admin";
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
		attendanceDao.leaveWork(attendanceDto);
		
		String id = "admin";
		//날짜변환 포멧
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		//기준 퇴근시간 =18시 30분
		String leaveWorkTime = LocalDate.now().atStartOfDay().plusHours(18).plusMinutes(30).format(formatter);
		//퇴근시간 문자열 포멧
		LocalDateTime leaveWorkTimeFormat = LocalDateTime.parse(leaveWorkTime,formatter);
		//해당아이디 퇴근시간 추출
		String todayLeave=attendanceDao.todayLeaveTime(id).getTime();
		//퇴근시간 추출 문자열 포멧
		LocalDateTime todayLeaveFormat = LocalDateTime.parse(todayLeave,formatter);
		
		
//		isBefore() : 인자보다 과거일 때 true가 리턴
//		isAfter() : 인자보다 미래일 때 true가 리턴
//		isEqual() : 인자와 같은 시간일 때 true가 리턴
		if(leaveWorkTimeFormat.isAfter(todayLeaveFormat)) {//만약 기준퇴근시간이 인자(todayLeaveFormat) 보다 미래이면
			return attendanceDao.leaveEarly(id); // 조퇴 반환
		}else if(attendanceDao.todaywork(id).getAttendanceWorkState().equals("지각")){//오늘 근무시간이 지각이면
			return attendanceDao.comeLateUpate(id); //지각 반환
		}else {
			return attendanceDao.normalWork(id);//정상근무==출근 반환
		}
		
		//8시간 이상이라면
		//8시간 이하라면
	}
	
	
	@GetMapping("/attendance/{attendanceStaffId}")
	public AttendanceWorkTimeVO find(@PathVariable String attendanceStaffId){
		attendanceStaffId = "admin";
		return attendanceDao.stardEnd(attendanceStaffId);
	}
	
}
