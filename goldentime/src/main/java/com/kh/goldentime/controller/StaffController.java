package com.kh.goldentime.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.goldentime.entity.StaffDto;
import com.kh.goldentime.repository.StaffDao;

@RestController
@RequestMapping("/rest")
public class StaffController {
	
	@Autowired
	private StaffDao staffDao;
	
	@GetMapping("/staff") //목록
	public List<StaffDto> list(){
		return staffDao.list();
	}
	
	@PostMapping("/staff") //등록
	public void insert(@RequestBody StaffDto staffDto) {
		staffDao.insert(staffDto);
	}

	@PutMapping("/staff") //수정
	public boolean edit(@RequestBody StaffDto staffDto) {
		return staffDao.edit(staffDto);	
	}
}