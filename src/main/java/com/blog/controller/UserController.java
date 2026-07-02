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
import com.blog.entity.Blog;
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
	public String profilePage(Principal principal, Model model,@RequestParam(required = false,defaultValue = "0") Integer id) {

		String authenticatedUserEmail = principal.getName();

		User user = userRepo.findByEmail(authenticatedUserEmail).get();
		
		if (id != 0) {
			
			Optional<Blog> optBlog = blogRepo.findById(id);
			
			if (optBlog.isPresent()) {

				Blog blog = optBlog.get();

				if (blog.getUser().getEmail().equals(authenticatedUserEmail)) {
					blogRepo.delete(blog);
					model.addAttribute("delete_msg", "Successfully Deleted");
				}
			}
		}

		List<Blog> blogs = blogRepo.findByUser(user);

		model.addAttribute("user", user);
		model.addAttribute("blogs", blogs);

		return AppUiPages.PROFILE;
	}
	
	@GetMapping("/edit-blog")
	public String editBlog(@RequestParam Integer id) {
		System.out.println(id);
		return AppUiPages.EDIT_USER;
	}

	
}
