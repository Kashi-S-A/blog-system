package com.blog.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.blog.entity.Blog;
import com.blog.entity.Status;
import com.blog.entity.User;

import java.util.List;


public interface BlogRepo extends JpaRepository<Blog, Integer> {

	Page<Blog> findByStatus(Pageable pageable, Status approved);

	Page<Blog> findByTitleOrTagsContainingIgnoreCaseAndStatus(String search, String search2, Pageable pageable,
			Status approved);
	
	List<Blog> findByUser(User user);
}