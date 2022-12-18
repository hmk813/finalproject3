package com.kh.goldentime.controller;


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

//	@RequestMapping("/practice")
//	public String practice(Model model) {
//		return "practice";
//	}

	
	
	

