package com.kh.goldentime.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view")
public class ViewController {

	@RequestMapping("/staff")
	public String staff() {
		return "staff";
	}
	
	
}
