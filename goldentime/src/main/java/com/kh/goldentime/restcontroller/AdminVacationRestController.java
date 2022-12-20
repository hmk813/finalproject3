package com.kh.goldentime.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.repository.AdminDao;
import com.kh.goldentime.vo.VacationStaffVO;

@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/admin")
@RestController
public class AdminVacationRestController {
	
	@Autowired
	AdminDao adminDao;
	
	@GetMapping("/vacation")
	@ResponseBody
	public List<VacationStaffVO> list(
			@RequestParam("type") String type,
			@RequestParam("keyword") String keyword
			
			) {
			
		VacationStaffVO vo  = new VacationStaffVO();
		vo.setType(type);
		vo.setKeyword(keyword);
		
			return adminDao.list(vo);
	}
	
	@PutMapping("/vacation/{vacationNo}")
	public boolean approve(@PathVariable int vacationNo) {
		return adminDao.approve(vacationNo);
	}
	
	@PutMapping("/vacation1/{vacationNo}")
	public boolean refuse(@PathVariable int vacationNo) {
		return adminDao.refuse(vacationNo);
	}
}
