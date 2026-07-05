package com.blog.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.constant.AppUiPages;
import com.blog.dto.UserDTO;
import com.blog.entity.Blog;
import com.blog.entity.Role;
import com.blog.entity.Status;
import com.blog.entity.User;
import com.blog.repo.BlogRepo;
import com.blog.repo.UserRepo;
import com.blog.service.BlogService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final BlogRepo blogRepo;

	private final UserRepo userRepo;
	
	private final BlogService blogservice;

	@GetMapping("/dashboard")
	public String dashBoardPage(Model model, @RequestParam(required = false, defaultValue = "0") Integer pageno) {

		Pageable pageable = PageRequest.of(pageno, 5);

		Page<Blog> all = blogRepo.findAll(pageable);

		model.addAttribute("blogs", all);

		return AppUiPages.ADMIN_DASHBOARD;
	}

	@GetMapping("/users")
	public String manageUsersPage(Model model, @RequestParam(required = false) String msg) {

		List<User> users = userRepo.findByRole(Role.USER);

		model.addAttribute("users", users);
		model.addAttribute("msg", msg);

		return AppUiPages.USERS;
	}

	@GetMapping("/edit-user")
	public String editUserPage(Integer uid, Model model) {

		User user = userRepo.findById(uid).get();

		model.addAttribute("user", user);

		return AppUiPages.EDIT_USER;
	}

	@PostMapping("/edit-user")
	public String editUser(UserDTO userDTO) {

		User user = userRepo.findById(userDTO.getId()).get();

		user.setUsername(userDTO.getUsername());
		user.setEmail(userDTO.getEmail());
		user.setRole(userDTO.getRole());

		userRepo.save(user);

		return "redirect:/admin/users?msg=User Updated Successfully";
	}

	@GetMapping("/delete")
	public String deleteUser(@RequestParam Integer uid) {

		Optional<User> opt = userRepo.findById(uid);
		if (opt.isPresent() && opt.get().getRole() == Role.USER) {
			userRepo.delete(opt.get());
			return "redirect:/admin/users?msg=User Deleted Successfully";
		}

		return "redirect:/admin/users?msg=Cannot deleted user";
	}
	
	@GetMapping("/post-mod")
	public String postMod(Model model,@RequestParam(required = false,defaultValue = "0")Integer pageno) {
		
		Pageable pageable = PageRequest.of(pageno, 5);
		
		Page<Blog> blogs = blogRepo.findByStatus(pageable, Status.PENDING);
		
		model.addAttribute("blogs", blogs);
		
		return AppUiPages.POST_MODERATION;
	}
	
	@GetMapping("/reports")
	public String reportsPage() {
		return AppUiPages.REPORT;
	}
	
	
	
	@GetMapping("/approve")
	public String approveBlog(@RequestParam Integer id) {

	    blogservice.approveBlog(id);

	    return "redirect:/admin/post-mod";
	}
	
	@GetMapping("/reject")
	public String rejectBlog(@RequestParam Integer id) {

	    blogservice.rejectBlog(id);

	    return "redirect:/admin/post-mod";
	}
	
	@GetMapping("/delete-blog")
	public String deleteBlog(@RequestParam Integer id) {

	    blogservice.removeBlog(id);

	    return "redirect:/admin/post-mod";
	}

}