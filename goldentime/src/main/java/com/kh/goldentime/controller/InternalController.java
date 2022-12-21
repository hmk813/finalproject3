package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.PatientDao;

@Controller
@RequestMapping("/internal")
public class InternalController { //내과
	
	@Autowired
	private PatientDao patientDao;
	
	//내과에서 볼 수 있는 금일 내과 접수 현황
		@GetMapping("/todaylist")
		public String internal(Model model) {
			model.addAttribute("PatientDepartmentVO", patientDao.internalList());
			model.addAttribute("PatientReservationDepartmentVO");
		    return "internal/todaylist";
		}

}
