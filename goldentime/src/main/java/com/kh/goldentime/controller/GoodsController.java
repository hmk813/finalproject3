package com.kh.goldentime.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GoodsController {

	@RequestMapping("goods/item")
	public String item() {
		return "goods/item";
	}
}
