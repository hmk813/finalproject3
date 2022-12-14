package com.kh.goldentime.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.AttendanceDao;
import com.kh.goldentime.repository.ReservationDao;
import com.kh.goldentime.repository.VacationDao;

@Controller
public class CalendarController {
	
//	@RequestMapping("/calendar")
//	public String calendar(Model model) {
//		
//		model.addAttribute("data","{start:\"2022-12-01\",title:\"테스트\"},{start:\"2022-12-01\",title:\"테스트\"},{start:\"2022-12-02\",title:\"테스트\"},{start:\"2022-12-03\",title:\"테스트\"}");
//		return "calendar";
//	}
//	
//	@RequestMapping("/test/{month}")
//	@ResponseBody
//	public String test(@PathVariable String  month) {
//		String result = "[{\"start\":\"2022-12-01\",\"title\":\"9시 내과\"},{\"start\":\"2022-12-03\",\"title\":\"11시 정형외과\"},{\"start\":\"2022-12-02\",\"title\":\"신경의학과\"},{\"start\":\"2022-12-14\",\"title\":\"외과\"},{\"start\":\"2022-12-18\",\"title\":\"영상의학과\"},{\"start\":\"2022-12-22\",\"title\":\"내과\"},{\"start\":\"2022-12-04\",\"title\":\"내과\"}]";
//		
//		return result;
//	}
//	
//	@RequestMapping("/popupdata/{date}")
//	@ResponseBody
//	public String popupData(@PathVariable String  date) {
//		String result = "[{\"sex\":\"남\",\"name\":\"우성준\"},{\"sex\":\"여\",\"name\":\"박지인\"},{\"sex\":\"남\",\"name\":\"박정민\"},{\"sex\":\"남\",\"name\":\"황문규\"}]";
//		
//		return result;
//	}

//캘린더 컨트롤러 지워도 될꺼같아요	
	
	@Autowired
	private ReservationDao reservationDao;
	
	@Autowired
	private VacationDao vacationDao;
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@RequestMapping("/calendar")//예약목록 불러오기
	public String calendar(Model model) {
		return "calendar";
	}
	
	@RequestMapping("/attendance")//출퇴근목록 불러오기
	public String attendance(Model model) {
		return "attendance";
	}
	
	@RequestMapping("/vacation")//연차목록 불러오기
	public String vacation(Model model) {
		return "vacation";
	}
	
	
}
