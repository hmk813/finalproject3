package com.kh.goldentime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/vacation")
public class VacationController {

	@GetMapping("/list")
	public String vacation(HttpSession session) {
		return "vacation/vacation";
	}
}
