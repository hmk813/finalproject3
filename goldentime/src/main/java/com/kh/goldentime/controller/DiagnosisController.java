package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.goldentime.repository.DiagnosisDao;

@Controller
public class DiagnosisController {
	
	@Autowired
	private DiagnosisDao diagnosisDao;
	
}
