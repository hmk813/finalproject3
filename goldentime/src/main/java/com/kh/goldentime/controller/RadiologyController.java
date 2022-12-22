package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReservationDao;

@Controller
@RequestMapping("/radiology")
public class RadiologyController {
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReservationDao reservationDao;

	//영상의학과에서 볼 수 있는 금일 영상의학과 접수 현황 
			@GetMapping("/todaylist")
			public String radiology(Model model) {
				model.addAttribute("PatientDepartmentVO", patientDao.radiologyList());
				model.addAttribute("PatientReservationDepartmentVO", reservationDao.toDayListRadiology());
				return "radiology/todaylist";
			}
}
