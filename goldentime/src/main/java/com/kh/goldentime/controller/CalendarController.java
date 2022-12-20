package com.kh.goldentime.controller;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.constant.SessionConstant;
import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.repository.StaffDao;

@Controller
public class CalendarController {

  @Autowired
	private StaffDao staffDao;
	
	@RequestMapping("/calendar")
	public String calendar(Model model,HttpSession session) {
	
		String loginId = (String) session.getAttribute(SessionConstant.ID);
		
		StaffDto staffDto = staffDao.selectOne(loginId);
		
		model.addAttribute("staffDto",staffDto);
		return "calendar";
	}

}
