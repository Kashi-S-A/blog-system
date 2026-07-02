<%@page import="java.util.List"%>
<%@page import="com.blog.entity.Blog"%>
<%@page import="org.springframework.data.domain.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog Dashboard</title>
<link rel="stylesheet" href="/style.css">

</head>

<body>

<!-- Header -->

<div class="header">

	<h2>Blog Dashboard</h2>

	<div class="navbar">

		<a href="/user/dashboard">Home</a>

		<a href="/user/post">Create New Post</a>

		<a href="#">Profile</a>

		<a href="/logout">Logout</a>

	</div>

</div>

<!-- Main -->

<div class="container">

	<h2>Blog Posts</h2>

	<form action="/user/dashboard" method="get" class="home-search-form">

		<input
			type="text"
			name="search"
			class="search-box"
			placeholder="Search posts...">

			<button type="submit" class="home-action-btn">
			    Search
			</button>

	</form>
	
	<form action="/user/dashboard" method="get" class="home-sort-form">
		<select class="sort-box" name="sort">

			<option value="createdDate">Sort by Date</option>

			<option value="title">Sort by Title</option>

		</select>
		
		<button type="submit" class="home-action-btn">
		        Sort
		</button>
	</form>

	<!-- Posts -->
	<%
		Page<Blog> pages =(Page<Blog>) request.getAttribute("blogs");
		if(!pages.isEmpty())
		{
			List<Blog> blogs = pages.getContent();
		for(Blog blog : blogs)
		{
	%>

	<div class="post">

		<h3><%=blog.getTitle()%></h3>

		<p>

			<b>Author :</b> <%=blog.getUser().getUsername()%>

			|

			<b>Date :</b> <%=blog.getCreatedDate()%>

		</p>

		<p>

			<%=blog.getContent()%>

		</p>

	</div>
	
	<%}} %>

	<%
		if(pages.hasPrevious())
		{
	%>
	<a href="/user/dashboard?pageno=<%= pages.getNumber()-1%>">
	<button class="button" >
		&laquo; Previous
	</button>
	</a>
	<%
		}
		if(pages.hasNext())
		{
	%>
	<a href="/user/dashboard?pageno=<%= pages.getNumber()+1%>">
	<button class="button" >
		 Next &raquo;
	</button>
	</a>
	<%
		}
	%>
	

</div>

<!-- Footer -->

<div class="footer">

	© 2026 Blog Platform

</div>

</body>
</html>