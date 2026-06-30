<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Blog Dashboard</title>
<link rel="stylesheet"
href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- Header -->

<div class="header">

	<h2>Blog Dashboard</h2>

	<div class="navbar">

		<a href="home">Home</a>

		<a href="post">Create New Post</a>

		<a href="profile">Profile</a>

		<a href="login">Logout</a>

	</div>

</div>

<!-- Main -->

<div class="container">

	<h2>Blog Posts</h2>

	<form>

		<input
			type="text"
			class="search-box"
			placeholder="Search posts...">

		<select class="sort-box">

			<option>Sort by Date</option>

			<option>Sort by Author</option>

			<option>Sort by Popularity</option>

		</select>

	</form>

	<!-- Dummy Post -->

	<div class="post">

		<h3>Introduction to Spring Boot</h3>

		<p>

			<b>Author :</b> Aman Shukla

			|

			<b>Date :</b> 29-06-2026

		</p>

		<p>

			Spring Boot is a powerful Java framework used for
			building REST APIs and enterprise applications with
			minimum configuration.

		</p>

		<a href="#">Read More</a>

	</div>

	<div class="post">

		<h3>Java Collection Framework</h3>

		<p>

			<b>Author :</b> John Doe

			|

			<b>Date :</b> 28-06-2026

		</p>

		<p>

			Collection Framework provides List, Set, Queue and Map
			interfaces for storing and manipulating data efficiently.

		</p>

		<a href="#">Read More</a>

	</div>

	<button class="button">
		&laquo; Previous
	</button>

	<button class="button">
		Next &raquo;
	</button>

</div>

<!-- Footer -->

<div class="footer">

	© 2026 Blog Platform

</div>

</body>
</html>