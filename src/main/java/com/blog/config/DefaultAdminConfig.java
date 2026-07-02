package com.blog.config;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.blog.entity.Role;
import com.blog.entity.User;
import com.blog.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class DefaultAdminConfig implements CommandLineRunner {

	
	private final UserRepo userRepo;
	private final PasswordEncoder passwordEncoder;

	@Override
	public void run(String... args) throws Exception {
		Optional<User> admin = userRepo.findByEmail("admin123@gmail.com");
		if(admin.isEmpty()) {
			User user=new User();
			user.setUsername("admin");
			user.setEmail("admin123@gmail.com");
			user.setPassword(passwordEncoder.encode("admin123"));
			user.setFullName("admin");
			user.setRole(Role.ADMIN);
			userRepo.save(user);
		}else {
			System.out.println("ADMIN IS ALREADY CREATED");
		}
		
	}
	
	
}
