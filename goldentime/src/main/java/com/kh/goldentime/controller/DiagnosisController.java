package com.kh.goldentime.controller;

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
import com.kh.goldentime.entity.ReceiveDto;
import com.kh.goldentime.entity.ReservationDto;
import com.kh.goldentime.repository.DiagnosisDao;
import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReceiveDao;
import com.kh.goldentime.repository.ReservationDao;

@Controller
@RequestMapping("/diagnosis")
public class DiagnosisController {
	
	@Autowired
	private DiagnosisDao diagnosisDao;
	
	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReceiveDao receiveDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	@GetMapping("/detail")
	public String detail(Model model, 
			@RequestParam (required = false) Integer diagnosisNo,
			@RequestParam (required = false) Integer receiveNo,
			@RequestParam (required = false) Integer reservationNo,
			@ModelAttribute DiagnosisDto diagnosisDto) {
		//환자 정보, 의사 이름 
		if(diagnosisNo != null) { //해당 접수에는 차트가 존재한다.(수정)
			diagnosisDto = diagnosisDao.selectOne(diagnosisNo);
			model.addAttribute("chartList", diagnosisDao.chartList(diagnosisDto.getDiagnosisPatientNo()));
			model.addAttribute("diagnosisDto", diagnosisDto);
			model.addAttribute("patientDto", patientDao.selectOne(diagnosisDto.getDiagnosisPatientNo()));
		}
		else if(diagnosisNo == null && receiveNo != null){ 
			ReceiveDto receiveDto = receiveDao.selectOne(receiveNo);
			model.addAttribute("patientDto", patientDao.selectOne(receiveDto.getPatientNo()));
			model.addAttribute("receiveDto", receiveDto);
		}
		else if(diagnosisNo == null && reservationNo != null) {
			ReservationDto reservationDto = reservationDao.reservationDetail(reservationNo);
			model.addAttribute("patientDto", patientDao.selectOne(reservationDto.getReservationPatientNo()));
			model.addAttribute("reservationDto", reservationDto);
		}
		
		return "diagnosis/detail";
	}
	
	@PostMapping("/detail")
	public String detail(@ModelAttribute DiagnosisDto diagnosisDto,
			RedirectAttributes attr) {
		if(diagnosisDto.getDiagnosisNo() != 0) {
			diagnosisDao.edit(diagnosisDto);
		}else if(diagnosisDto.getDiagnosisNo() == 0) {
			System.out.println(diagnosisDto);
			if(diagnosisDto.getReceiveNo() > 0 && diagnosisDto.getReservationNo() == 0) {
				diagnosisDao.insert(diagnosisDto);
				diagnosisDto.setDiagnosisNo(diagnosisDao.sequence());
			}else if(diagnosisDto.getReservationNo() > 0 && diagnosisDto.getReceiveNo() == 0) {
				diagnosisDao.insert1(diagnosisDto);
				diagnosisDto.setDiagnosisNo(diagnosisDao.sequence());
			}
		}
		attr.addAttribute("diagnosisNo", diagnosisDto.getDiagnosisNo());
		return "redirect:detail";
	}
	
}
