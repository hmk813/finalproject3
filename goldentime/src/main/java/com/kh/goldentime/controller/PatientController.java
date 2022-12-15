package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.vo.PatientReceiveListVO;
import com.kh.goldentime.vo.PatientReservationListVO;

@Controller
@RequestMapping("/patient")
public class PatientController {

	@Autowired
	private PatientDao patientDao;
	
//	@GetMapping("/todaylist")
//	public String todayList(Model model) {
//		model.addAttribute("list", patientDao.todayList());
//		return"patient/todaylist";
//	}
//	
//	@GetMapping("/historylist")
//	public String historyList(Model model) {
//		model.addAttribute("list", patientDao.historyList());
//		return"patient/historylist";
//	}
//	
//	// 환자 목록 
//	@GetMapping("/todaylist")
//	public String list(Model model) {
//		model.addAttribute("patientReceiveListVO", patientDao.todayList());
//		model.addAttribute("patientReservationListVO", patientDao.historyList());
//		return"patient/todaylist";
//	}
}
