package com.kh.goldentime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.constant.SessionConstant;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.repository.AttendanceDao;
import com.kh.goldentime.repository.StaffDao;
import com.kh.goldentime.repository.VacationDao;

@Controller
public class HomeController {
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private StaffDao staffDao;
	
	@Autowired
	private AttendanceDao attendanceDao;
	
	@Autowired
	private VacationDao vacationDao;
	
	@RequestMapping("home")
	public String home() {
		return "home";
	}
	
//	@GetMapping("/login")
//	public String login() {
//		return "login";
//	}
//	
//	@PostMapping("/login")
//	public String login(@ModelAttribute StaffDto inputDto,
//			HttpSession session) {
//		StaffDto findDto = staffDao.selectOne(inputDto.getStaffId());
//		if(findDto == null) {
//			return "redirect:login?error";
//		}
//		
//		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//		boolean passwordMatch = encoder.matches(inputDto.getStaffPw(), findDto.getStaffPw());
//	//			inputDto.getStaffPw().equals(findDto.getStaffPw()); 
//		if(passwordMatch) {
//			session.setAttribute(SessionConstant.ID, inputDto.getStaffId());
//			session.setAttribute(SessionConstant.GRADE, findDto.getStaffGrade());
//			
//			return "redirect:/mypage";
//		}
//		else {
//			return "redirect:login?error";
//		}
//	}
//	
//	
//	@RequestMapping("/mypage")
//	public String mypage(HttpSession session, Model model) {
//		//세션에 들어있는 아이디를 꺼낸다
//		String loginId = (String) session.getAttribute(SessionConstant.ID);
//		
//		//아이디를 이용하여 직원 정보를 불러온다
//		StaffDto staffDto = staffDao.selectOne(loginId);
//		
//		//불러온 회원 정보를 모델에 첨부한다
//		model.addAttribute("staffDto",staffDto);
//		model.addAttribute("attendanceDto",attendanceDao.todaywork(staffDto.getStaffId()));
//		model.addAttribute("vacationStaffVO", vacationDao.list(staffDto.getStaffId()));
//		
//		return "mypage";
//	}
}
