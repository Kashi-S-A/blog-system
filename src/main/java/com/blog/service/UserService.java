package com.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.blog.entity.User;
import com.blog.repo.UserRepo;

@Service
public class UserService implements UserDetailsService {

	@Autowired
	private UserRepo userRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		User dbUser = userRepo.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("User Not Found"));
		return org.springframework.security.core.userdetails.
				User.withUsername(dbUser.getEmail())
				    .password(dbUser.getPassword())
				    .roles(dbUser.getRole().name())
				    .build();
	}

}
