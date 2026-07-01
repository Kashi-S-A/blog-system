package com.blog.controller;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.entity.Blog;
import com.blog.repo.BlogRepo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final BlogRepo blogRepo;

	@GetMapping("/dashboard")
	public String dashBoardPage(Model model, @RequestParam(required = false, defaultValue = "0") Integer pageno) {

		Pageable pageable = PageRequest.of(pageno, 5);
		Page<Blog> blogs = blogRepo.findAll(pageable);

		model.addAttribute("blogs", blogs);

		return "home.jsp";
	}
}
