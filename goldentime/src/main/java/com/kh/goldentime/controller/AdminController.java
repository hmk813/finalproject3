package com.kh.goldentime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.AdminDao;
import com.kh.goldentime.vo.AdminAttendSearchVO;
import com.kh.goldentime.vo.AdminAttendanceVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	AdminDao adminDao;

	@GetMapping("/")
	public String home() {
		return "admin/home";
	}
	
	//관리자가 볼 수 있는 직원 출퇴근 현황 목록
	@GetMapping("/attendance")
	public String vacation(Model model, @ModelAttribute AdminAttendanceVO adminAttendanceVO) {
		
		List<AdminAttendanceVO> list = adminDao.attendanceList(adminAttendanceVO);
		model.addAttribute("attendanceList", list);
		return "admin/attendance";
	}
	
}
