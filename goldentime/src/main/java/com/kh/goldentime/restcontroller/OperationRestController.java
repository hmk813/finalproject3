package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.PatientDto;
import com.kh.goldentime.repository.OperationDao;
import com.kh.goldentime.vo.OperationInformationVO;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@RestController
public class OperationRestController {
	@Autowired
	OperationDao operationDao;
	
//	@GetMapping("/operationlist")
//	public List<OperationInformationVO>  selectList(){
//		return operationDao.selectList();
//	}
	
	@GetMapping("/operationlist")
	public List<PatientDto>  selectList(){
		return operationDao.selectPatientList();
	}
	
//	@GetMapping("/operationlist/{patientNo}")
//	public List<OperationInformationVO>  selectList(@PathVariable int patientNo){
//		return operationDao.selectList();
//	}
	
	@GetMapping("/operationlist/{patientNo}")
	public OperationInformationVO selectOne(@PathVariable int patientNo) {
		return operationDao.selectOne(patientNo);
	}
	
//	@GetMapping("/operationlist/{patientNo}")
//	public  OperationInformationVO selectOne(@PathVariable int patientNo) {
//		return operationDao.selectOne(patientNo);
//	}
	
}
