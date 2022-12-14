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
	
	@RequestMapping("/attendance")
	public String attendance() {
		return "attendance";
	}
	
	@RequestMapping("/patient")
	public String patient() {
		return "patient";
	}
	
	@RequestMapping("/drug")
	public String drug() {
		return "drug";
	}
	
}
