<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Post</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

	<!-- Header -->

	<div class="header">

		<h2>Admin Blog Dashboard</h2>

		<div class="navbar">

			<a href="#">Manage Posts</a>
			
			<a href="#">Manage Users</a>

			<a href="#">Post Moderation</a>

			<a href="#">Reports</a>

			<a href="/logout">Logout</a>

		</div>

	</div>

	<!-- Main -->

	<div class="container">

		<h2>Edit Post</h2>

		<form action="#" method="post">

			<label>Post ID</label>

			<input
				type="text"
				class="input-box"
				value="101"
				readonly>

			<label>Title</label>

			<input
				type="text"
				class="input-box"
				value="Spring Boot Basics">

			<label>Author</label>

			<input
				type="text"
				class="input-box"
				value="Aman Shukla">

			<label>Content</label>

			<textarea class="input-box">

Spring Boot is a Java framework used to build enterprise applications.

			</textarea>

			<label>Status</label>

			<select class="input-box">

				<option>Published</option>

				<option>Pending</option>

				<option>Rejected</option>

			</select>

			<button
				type="submit"
				class="form-btn blue">

				Update Post

			</button>

			<button
				type="reset"
				class="form-btn black">

				Cancel

			</button>

		</form>

	</div>

	<!-- Footer -->

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>