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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.entity.ReceiveDto;
import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReceiveDao;
import com.kh.goldentime.vo.PatientListSearchVO;

@Controller
@RequestMapping("/patient")
public class PatientController {

	@Autowired
	private PatientDao patientDao;
	
	@Autowired
	private ReceiveDao receiveDao;
	
	@GetMapping("/todaylist")
	public String list(Model model) {
	       model.addAttribute("list", patientDao.selectList());
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
		return "redirect:list";
	}
	
	@PostMapping("/search")
	public String search(@RequestParam(value="type", required = false) String type,
										@RequestParam(value="keyword", required=false) String keyword,
										Model model) {
		return "list";
	}
}
