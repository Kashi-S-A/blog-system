package com.blog.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.constant.AppUiPages;
import com.blog.dto.BlogDTO;
import com.blog.dto.BlogUpdateDTO;
import com.blog.service.BlogService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final BlogService blogService;

	@GetMapping("/dashboard")
	public String dashBoardPage(Model model, @RequestParam(required = false, defaultValue = "0") Integer pageno,
			@RequestParam(required = false, defaultValue = "null") String search,
			@RequestParam(required = false, defaultValue = "null") String sort) {
		return blogService.dashboard(model, pageno, search, sort);
	}

	@GetMapping("/post")
	public String search() {
		return AppUiPages.POST;
	}

	@PostMapping("/post")
	public String saveBlog(Principal principal, BlogDTO blogDTO, Model model) {

		return blogService.saveBlog(principal,blogDTO,model);
	}

	@GetMapping("/profile")
	public String profilePage(Principal principal, Model model,
			@RequestParam(required = false, defaultValue = "0") Integer id) {

		return blogService.profile(principal, model, id);
	}

	@GetMapping("/edit-blog")
	public String editBlog(Principal principal,Model model,@RequestParam Integer id,@RequestParam(required = false,defaultValue = "no") String update) {

		return blogService.editBlog(principal,model,id,update);
	}
	
	@PostMapping("/edit")
	public String updateBlog(Model model,BlogUpdateDTO blogUpdateDTO) {
		
		return blogService.updateBlog(model,blogUpdateDTO);
	}

}
