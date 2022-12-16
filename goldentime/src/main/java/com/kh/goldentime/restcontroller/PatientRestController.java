package com.kh.goldentime.restcontroller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.repository.PatientDao;
import com.kh.goldentime.repository.ReceiveDao;

@CrossOrigin
@RestController
@RequestMapping("/rest")
public class PatientRestController {
	
	@Autowired
	private PatientDao patientDao ;
	
	@Autowired
	private ReceiveDao receiveDao;
	
	@PostMapping("/patient")
	public void insert(@RequestBody PatientDto dto) {
		
		// 환자 번호 뽑기

		patientDao.insert(dto); // 환자 테이블 등록
		//receiveDao.insert(null) // 뽑은 환자 번호하고 입력받은 직원 아이디로 접수 테이블 등록
	}
	
	@PutMapping("/patient")
	public boolean edit(@RequestBody PatientDto dto) {
		return dao.edit(dto);
	}

}
