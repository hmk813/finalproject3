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
import com.kh.goldentime.repository.ReservationDao;

@Controller
@RequestMapping("/patient")
public class PatientController {

	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReceiveDao receiveDao;
	
	@Autowired
	private ReservationDao reservationDao;
	
	//원무과에서 볼 수 있는 금일 접수 현황
	@GetMapping("/todaylist")
	public String list(Model model) {
		model.addAttribute("PatientReceiveListVO", patientDao.todayList());
		model.addAttribute("PatientReservationListVO", reservationDao.todayList());
	    return "patient/todaylist";
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
		return "redirect:todaylist";
	}
	
	@PostMapping("/insert1")
	public String insert1(@ModelAttribute ReceiveDto receiveDto) {
		receiveDao.insert(receiveDto);
		return "redirect:todaylist";
	}
	
	//원무과에서 볼 수 있는 환자 기록 
		@GetMapping("/historylist")
		public String historylist(Model model) {
			model.addAttribute("PatientReceiveListVO", patientDao.historyList());
		    return "patient/historylist";
		}

}
