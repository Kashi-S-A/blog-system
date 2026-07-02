<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Post</title>

<link rel="stylesheet"
	href="/style.css">

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
	<h4 style="color: green">${msg}</h4>
		<h2>Create New Post</h2>

		<form action="/user/post" method="post">

			<label>Title</label>

			<input
				type="text"
				name="title"
				class="input-box"
				placeholder="Enter Blog Title">

			<label>Content</label>

			<textarea
				class="input-box"
				name="content"
				placeholder="Write your blog here..."></textarea>

			<label>Tags</label>

			<input
				type="text"
				name="tags"
				class="input-box"
				placeholder="Java, Spring Boot, JSP">

			<button
				type="submit"
				class="form-btn black">

				Publish

			</button>

		</form>

	</div>

	<!-- Footer -->

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>