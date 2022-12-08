package com.kh.goldentime.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.goldentime.repository.OperationDao;

@Controller
@RequestMapping("/operation")
public class OperationController {
	
	@Autowired
	private OperationDao operationDao;
	
	@GetMapping("/operationlist")
	public String list(Model model) {
		model.addAttribute("operationInformationVO", operationDao.selectList());
		return"operationlist";
	}
}