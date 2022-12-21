package com.kh.goldentime.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.AttendanceDao;
import com.kh.goldentime.vo.AttendanceListVO;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@GetMapping("/list")
	public String list(@ModelAttribute AttendanceListVO vo, Model model,HttpSession session) {
		String findId = (String) session.getAttribute("loginId");
		AttendanceListVO id1 = AttendanceListVO.builder().
				attendanceStaffId(findId)
				.beginMade(null)
				.endMade(null)
				.build();
		
		AttendanceListVO id2 = AttendanceListVO.builder().
				attendanceStaffId(findId)
				.beginMade(vo.getBeginMade())
				.endMade(vo.getEndMade())
				.build();
		
		boolean isSearch = vo.getBeginMade() != null && vo.getEndMade() != null;
		
		if(isSearch) {//검색
			model.addAttribute("attendaceList", attendanceDao.attendanceList(id2));
		}
		else {//목록
			model.addAttribute("attendaceList",attendanceDao.attendanceList(id1));
		}
		
		//이번달 출근 현황 조회(출근 지각 조퇴)를 model로 넘김
		model.addAttribute("thismonth",attendanceDao.thisMonth(findId));
		
		//오늘 출퇴근 시간
		model.addAttribute("startEnd", attendanceDao.stardEnd(findId));
		
		
		return "attendance/list";
	}
}
