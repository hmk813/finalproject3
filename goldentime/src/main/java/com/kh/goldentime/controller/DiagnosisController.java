package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.goldentime.repository.DiagnosisDao;

@Controller
@RequestMapping("/diagnosis")
public class DiagnosisController {
	
	@Autowired
	private DiagnosisDao diagnosisDao;
	
	@GetMapping("/detail")
	public String detail(Model model, @RequestParam int receiveNo) {
		//환자 정보, 의사 이름 
		model.addAttribute("");
		return "diagnosis/detail";
	}
	
}
