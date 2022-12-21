package com.kh.goldentime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.goldentime.entity.DiagnosisDto;
import com.kh.goldentime.repository.DiagnosisDao;
import com.kh.goldentime.repository.PatientDao;

@Controller
@RequestMapping("/diagnosis")
public class DiagnosisController {
	
	@Autowired
	private DiagnosisDao diagnosisDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@GetMapping("/detail")
	public String detail(Model model, 
			@RequestParam int diagnosisNo,
			@ModelAttribute DiagnosisDto diagnosisDto) {
		//환자 정보, 의사 이름 
		if(diagnosisNo != 0) { //해당 접수에는 차트가 존재한다.(수정)
			model.addAttribute("diagnosisDto", diagnosisDao.selectOne(diagnosisNo));
		}
		else { // 차트가 존재하지 않는다.(추가)
			diagnosisDto.setDiagnosisNo(diagnosisDao.sequence());
			diagnosisNo = diagnosisDto.getDiagnosisNo();
			diagnosisDao.insert(diagnosisDto);
			model.addAttribute("diagnosisDto", diagnosisDao.selectOne(diagnosisNo));
		}
		return "diagnosis/detail";
	}
	
}
