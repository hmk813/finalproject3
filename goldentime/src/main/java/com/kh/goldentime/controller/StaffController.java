package com.kh.goldentime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.repository.StaffDao;

@Controller
@RequestMapping("/staff")
public class StaffController {
	
	@Autowired
	private StaffDao staffDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		return "staff/list";
	}
	
	@GetMapping("/login")
	public String login() {
		return "staff/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session,
			@RequestParam String staffId,
			@RequestParam String staffPw) {
		StaffDto findDto = staffDao.selectOne(staffId);
		
		boolean isLogin = staffPw.equals(findDto.getStaffPw());
		return staffPw;
		
	}
	
}