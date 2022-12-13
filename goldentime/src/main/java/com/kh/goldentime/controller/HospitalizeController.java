package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.HospitalizeDao;

@Controller
@RequestMapping("/hospitalize")
public class HospitalizeController {
	
	@Autowired
	private HospitalizeDao hospitalizeDao;
	
	//입퇴원 환자 목록 
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("hospitalizeInformationVO", hospitalizeDao.selectList());
		return"hospitalize";
	}
}
