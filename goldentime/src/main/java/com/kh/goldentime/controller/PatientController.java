package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.entity.ReceiveDto;
import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReceiveDao;

@Controller
@RequestMapping("/patient")
public class PatientController {

	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReceiveDao receiveDao;
	
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", patientDao.selectList());
		return "patient/list";
	}
	
	@GetMapping("/insert")
	public String insert() {
		return "patient/insert";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute PatientDto patientDto, 
										@ModelAttribute ReceiveDto receiveDto) {
		
		int seqNo = patientDao.patientseq();
		patientDto.setPatientNo(seqNo);
		patientDao.insert(patientDto);

		receiveDto.setPatientNo(seqNo);
		receiveDao.insert(receiveDto);
		return "redirect:list";
	}
}
