package com.kh.goldentime.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	
	@RequestMapping("/calendar")
	public String calendar(Model model) {
		
		model.addAttribute("data","{start:\"2022-12-01\",title:\"테스트\"},{start:\"2022-12-01\",title:\"테스트\"},{start:\"2022-12-02\",title:\"테스트\"},{start:\"2022-12-03\",title:\"테스트\"}");
		return "calendar";
	}
	
	@RequestMapping("/test/{month}")
	@ResponseBody
	public String test(@PathVariable String  month) {
		String result = "[{\"start\":\"2022-12-01\",\"title\":\"9시 내과\"},{\"start\":\"2022-12-03\",\"title\":\"11시 정형외과\"},{\"start\":\"2022-12-02\",\"title\":\"신경의학과\"},{\"start\":\"2022-12-14\",\"title\":\"외과\"},{\"start\":\"2022-12-18\",\"title\":\"영상의학과\"},{\"start\":\"2022-12-22\",\"title\":\"내과\"},{\"start\":\"2022-12-04\",\"title\":\"내과\"}]";
		
		return result;
	}
	
	@RequestMapping("/popupdata/{date}")
	@ResponseBody
	public String popupData(@PathVariable String  date) {
		String result = "[{\"sex\":\"남\",\"name\":\"우성준\"},{\"sex\":\"여\",\"name\":\"박지인\"},{\"sex\":\"남\",\"name\":\"박정민\"},{\"sex\":\"남\",\"name\":\"황문규\"}]";
		
		return result;
	}
	
//	@RequestMapping("/calModal")
//	@ResponseBody
//	public String calModal() {
//		return "calModal";
//	}
}
