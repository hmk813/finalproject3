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
	
	// 게시글 목록 Mapping (회원)
	   @GetMapping("/list")
	   public String selectFreeboard(Model model, @ModelAttribute AdminAttendSearchVO adminAttendSearchVO) {
	      // 게시글 총 갯수 반환
	      int total = adminDao.countFreeboard(adminAttendSearchVO);
	      // 반환한 총 갯수를 freeboardListVO의 total로 설정
	      adminAttendSearchVO.setTotal(total);
	      // 유형에 따른 게시글 조회 결과 반환
	      List<AdminAttendanceVO> list = adminDao.searchFreeboard(adminAttendSearchVO);
	      // 조회 결과를 model에 추가
	      model.addAttribute("list", list);
	      // 게시글 목록 페이지(list.jsp)로 연결
	      return "admin/test";
	   }
}
