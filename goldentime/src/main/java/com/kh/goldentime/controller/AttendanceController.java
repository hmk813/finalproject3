package com.kh.goldentime.controller;

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
	public String list(@ModelAttribute AttendanceListVO vo, Model model) {
		String findId = "test5";
		
		//검색일때
		AttendanceListVO list = AttendanceListVO.builder().
				attendanceStaffId(findId)
				.beginMade(null)
				.endMade(null)
				.build();
		
		//목록일때
		AttendanceListVO search = AttendanceListVO.builder().
				attendanceStaffId(findId)
				.beginMade(vo.getBeginMade())
				.endMade(vo.getEndMade())
				.build();
		
		//마이바티스에서 달력 검색할때 null값 체크
		boolean isSearch = vo.getBeginMade() != null && vo.getEndMade() != null;
		
		if(isSearch) {//검색
			model.addAttribute("attendaceList", attendanceDao.attendanceList(search));
		}
		else {//목록
			model.addAttribute("attendaceList",attendanceDao.attendanceList(list));
		}
		return "attendance/list";
	}
}
