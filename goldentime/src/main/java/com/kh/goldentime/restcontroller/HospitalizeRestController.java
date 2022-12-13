package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.repository.HospitalizeDao;
import com.kh.goldentime.vo.HospitalizeInformationVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@RestController
public class HospitalizeRestController {
	@Autowired
	HospitalizeDao hospitalizeDao;
	
	@GetMapping("/hospitalizelist")
	public List<HospitalizeInformationVO> selectList(){
		return hospitalizeDao.selectList();
	}
}
