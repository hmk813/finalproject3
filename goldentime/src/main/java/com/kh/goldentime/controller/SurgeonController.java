package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReservationDao;

@Controller
@RequestMapping("/surgeon")
public class SurgeonController { //외과

	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	//외과에서 볼 수 있는 금일 외과 접수 현황
			@GetMapping("/todaylist")
			public String surgeon(Model model) {
				model.addAttribute("PatientDepartmentVO", patientDao.surgeonList());
				model.addAttribute("PatientReservationDepartmentVO", reservationDao.toDayListSurgery());
			    return "surgeon/todaylist";
			}
}
