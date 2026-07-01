package com.blog.controller;

import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.blog.dto.RegisterDTO;
import com.blog.entity.User;
import com.blog.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

	private final UserRepo userRepo;

	private final PasswordEncoder passwordEncoder;

	@GetMapping("/register")
	public String registerPage() {
		return "register.jsp";
	}

	@GetMapping("/login")
	public String loginPage(@RequestParam(required = false) String msg, Model model) {
		model.addAttribute("err", msg);
		return "login.jsp";
	}

	@PostMapping("/register")
	public String registerUser(RegisterDTO registerDTO, Model model) {

		Optional<User> opt = userRepo.findByEmail(registerDTO.getEmail());

		if (opt.isPresent()) {
			model.addAttribute("err", "Already Register");
			return "login.jsp";
		}

		User user = new User();
		BeanUtils.copyProperties(registerDTO, user);
		user.setPassword(passwordEncoder.encode(registerDTO.getPassword()));

		userRepo.save(user);
		model.addAttribute("succ", "Registered Successfully");
		return "login.jsp";
	}

}
