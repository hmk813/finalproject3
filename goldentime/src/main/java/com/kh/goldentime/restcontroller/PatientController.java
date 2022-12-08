package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.repository.PatientDao;

@CrossOrigin
@RestController
@RequestMapping("/rest")
public class PatientController {
	
	@Autowired
	private PatientDao dao;
	
	@GetMapping("/patient")
	public List<PatientDto> list() {
		return dao.list();
	}
	
	@PostMapping("/patient")
	public void insert(@RequestBody PatientDto dto) {
		dao.insert(dto);
	}
	
	@PutMapping("/patient")
	public boolean edit(@RequestBody PatientDto dto) {
		return dao.edit(dto);
	}

}