package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.repository.PatientDao;

@Controller
@RequestMapping("/patient")
public class PatientController {
	
	@Autowired
	private PatientDao patientDao;
	
	@GetMapping("/insert")
	public String insert() {
		return "patient/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute PatientDto patientDto) {
		patientDao.insert(patientDto);
		return "redirect:list";
	}

	
}
