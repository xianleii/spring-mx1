package com.xianlei.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class IndexController {
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request){
		
		return "index";
	}
	@RequestMapping("/welcome")
    public String welcome() {
        return  "welcome";
    }

}
