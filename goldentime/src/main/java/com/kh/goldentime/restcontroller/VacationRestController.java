package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.VacationDto;
import com.kh.goldentime.repository.VacationDao;
import com.kh.goldentime.vo.VacationStaffVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@RestController
public class VacationRestController {

	@Autowired
	VacationDao vacationDao;

	@GetMapping("/vacation/{VacationStaffId}")
	public List<VacationStaffVO> list(@PathVariable String VacationStaffId) {
		return vacationDao.list(VacationStaffId);
	}
	
	
	@PostMapping("/vacation")
	public void enroll(@RequestBody VacationDto vacationDto) {
		vacationDao.enroll(vacationDto);
	}
	
}
