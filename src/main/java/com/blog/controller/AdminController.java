package com.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.blog.constant.AppUiPages;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/dashboard")
	public String dashBoardPage() {
		return AppUiPages.ADMIN_DASHBOARD;
	}

}
