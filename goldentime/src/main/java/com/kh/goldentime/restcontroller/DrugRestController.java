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

import com.kh.goldentime.entity.DrugDto;
import com.kh.goldentime.repository.DrugDao;

@CrossOrigin
@RestController
@RequestMapping("/rest")
public class DrugRestController {
	
	@Autowired
	private DrugDao dao;
	
	@GetMapping("/drug")
	public List<DrugDto> list() {
		return dao.list();
	}
	
	@PostMapping("/drug")
	public void insert(@RequestBody DrugDto dto) {
		dao.insert(dto);
	}
	
	@PutMapping("/drug")
	public boolean edit(@RequestBody DrugDto dto) {
		return dao.edit(dto);
	}
}
