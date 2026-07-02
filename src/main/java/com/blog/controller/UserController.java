package com.blog.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.constant.AppUiPages;
import com.blog.dto.BlogDTO;
import com.blog.dto.BlogUpdateDTO;
import com.blog.entity.Blog;
import com.blog.entity.Role;
import com.blog.entity.Status;
import com.blog.entity.User;
import com.blog.repo.BlogRepo;
import com.blog.repo.UserRepo;
import com.blog.service.BlogService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

	private final BlogRepo blogRepo;

	private final BlogService blogService;

	private final UserRepo userRepo;

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

		String email = principal.getName();

		User user = userRepo.findByEmail(email).get();

		Blog blog = new Blog();
		BeanUtils.copyProperties(blogDTO, blog);

		blog.setUser(user);

		blogRepo.save(blog);

		model.addAttribute("msg", "Blog published,status is : " + Status.PENDING);

		return AppUiPages.POST;
	}

	@GetMapping("/profile")
	public String profilePage(Principal principal, Model model,
			@RequestParam(required = false, defaultValue = "0") Integer id) {

		return blogService.profile(principal, model, id);
	}

	@GetMapping("/edit-blog")
	public String editBlog(Principal principal,Model model,@RequestParam Integer id,@RequestParam(required = false,defaultValue = "no") String update) {

		if (!update.equals("no")) {
			model.addAttribute("update", update);
		}
		String authenticatedUserEmail = principal.getName();
		Optional<Blog> optBlog =blogRepo.findById(id);
		
		Blog blog = null; 
		
		if(optBlog.isPresent()) {
			blog = optBlog.get();
			
			if (!blog.getUser().getEmail().equals(authenticatedUserEmail)) {
				return "redirect:/user/profile";
			}
		}
		
		blog = optBlog.get();
		
		String status = blog.getStatus().name();
		String role = blog
				.getUser()
				.getRole()
				.name();
		
		model.addAttribute("status",status);
		model.addAttribute("role",role);
		model.addAttribute("blog", blog);

		return AppUiPages.EDIT_POST;
	}
	
	@PostMapping("/edit")
	public String updateBlog(Model model,BlogUpdateDTO blogUpdateDTO) {
		
		Blog blog = blogRepo.findById(blogUpdateDTO.getId()).get();
		
		blog.setTitle(blogUpdateDTO.getTitle());
		blog.setContent(blogUpdateDTO.getContent());
		
		blogRepo.save(blog);
		
		return "redirect:/user/edit-blog?id=" + blog.getId() +"&update=Succesfully Update";
	}

}
