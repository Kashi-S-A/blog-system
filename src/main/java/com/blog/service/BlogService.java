package com.blog.service;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.blog.constant.AppUiPages;
import com.blog.entity.Blog;
import com.blog.entity.Status;
import com.blog.entity.User;
import com.blog.repo.BlogRepo;
import com.blog.repo.UserRepo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BlogService {
	
	private final BlogRepo blogRepo;
	private final UserRepo userRepo;

	public String dashboard(Model model,int pageno,String search,String sort) {
		Pageable pageable = PageRequest.of(pageno, 5);
		Page<Blog> blogs = null;

		if (!search.equals("null")) {
			blogs = blogRepo.findByTitleOrTagsContainingIgnoreCaseAndStatus(search, search, pageable,Status.APPROVED);
			model.addAttribute("blogs", blogs);
			return AppUiPages.HOME;
		}

		if (!sort.equals("null")) {
			Sort by = null;
			if (sort.equals("title")) {
				by = Sort.by(sort).ascending();
			} else {
				by = Sort.by(sort).descending();
			}
			Pageable page = PageRequest.of(pageno, 5, by);
			Page<Blog> all = blogRepo.findByStatus(page,Status.APPROVED);
			model.addAttribute("blogs", all);
			return AppUiPages.HOME;
		}

		blogs = blogRepo.findByStatus(pageable,Status.APPROVED);
		model.addAttribute("blogs", blogs);

		return AppUiPages.HOME;
	}
	
	public String profile(Principal principal,Model model,Integer id) {
		
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
}
