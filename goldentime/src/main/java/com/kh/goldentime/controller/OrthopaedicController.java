package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReservationDao;

@Controller
@RequestMapping("/orthopaedic")
public class OrthopaedicController {//정형외과
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReservationDao reservationDao;

	//정형외과에서 볼 수 있는 금일 정형외과 접수 현황 
			@GetMapping("/todaylist")
			public String orthopaedic(Model model) {
				model.addAttribute("PatientDepartmentVO", patientDao.orthopaedicList());
				model.addAttribute("PatientReservationDepartmentVO", reservationDao.toDayListOrthopedic());
				return "orthopaedic/todaylist";
			}
}
