package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.DiagnosisDto;
import com.kh.goldentime.repository.DiagnosisDao;

@CrossOrigin
@RestController
@RequestMapping("/rest")
public class DiagnosisRestController {
	
	@Autowired
	private DiagnosisDao dao;
	
	@PutMapping("/diagnosis")
	public boolean edit(@RequestBody DiagnosisDto dto) {
		return dao.edit(dto);
	}
}
