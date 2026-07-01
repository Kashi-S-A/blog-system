package com.blog.config;

import java.io.IOException;
import java.util.Collection;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) {
		
		http.csrf(c -> c.disable())
			.authorizeHttpRequests(req ->
					req.requestMatchers("/auth/**").permitAll()
					   .requestMatchers("/admin/**").hasRole("ADMIN")
					   .requestMatchers("/user/**").hasRole("USER")
					   .anyRequest()
					   .permitAll())
			.formLogin(l -> 
					  l.loginPage("/auth/login")//GET
					   .loginProcessingUrl("/auth/login")//POST
					   .successHandler(this::loginSuccessHandler)
					   .failureUrl("/auth/login?msg=Invalid Credentials"))
			.logout(l -> l.logoutUrl("/logout"));
		
		return http.build();
	}
	
	public void loginSuccessHandler(HttpServletRequest request,HttpServletResponse response,
			Authentication authenticate) throws IOException {
		Collection<? extends GrantedAuthority> authorities = authenticate.getAuthorities();
		
		for (GrantedAuthority auth : authorities) {
			if (auth.getAuthority().equals("ROLE_ADMIN")) {
				response.sendRedirect("/admin/dashboard");
				return ;
			}
			if (auth.getAuthority().equals("ROLE_USER")) {
				response.sendRedirect("/user/dashboard");
				return ;
			}
		}
		
	}
	

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
