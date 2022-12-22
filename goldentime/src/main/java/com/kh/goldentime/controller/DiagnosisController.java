package com.kh.goldentime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
			diagnosisDto = diagnosisDao.selectOne(diagnosisNo);
			model.addAttribute("diagnosisDto", diagnosisDto);
			model.addAttribute("patientDto", patientDao.selectOne(diagnosisDto.getDiagnosisPatientNo()));
		}
		else { // 차트가 존재하지 않는다.(추가)
			diagnosisDto.setDiagnosisNo(diagnosisDao.sequence());
			diagnosisNo = diagnosisDto.getDiagnosisNo();
			diagnosisDao.insert(diagnosisDto);
			//안되는 이유 insert 내용이 현재 시퀀스 번호 밖에 없음
			//필요한 데이터 직원아이디, 환자번호, 예약&접수 번호, 나머지는 null 처리
			model.addAttribute("diagnosisDto", diagnosisDao.selectOne(diagnosisNo));
		}
		return "diagnosis/detail";
	}
	
	@PostMapping("/detail")
	public String detail(@ModelAttribute DiagnosisDto diagnosisDto,
			RedirectAttributes attr) {
		diagnosisDao.edit(diagnosisDto);
		attr.addAttribute("diagnosisNo", diagnosisDto.getDiagnosisNo());
		return "redirect:detail";
	}
	
}
