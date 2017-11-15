package com.xianlei.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class IndexController {
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request){
		
		return "index";
	}

}
