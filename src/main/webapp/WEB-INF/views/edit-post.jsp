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
	<%
	if("${role}".equals("ADMIN")){
	%>

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
	
	<% } else { %>
	
	<div class="header">

		<h2>Blog Dashboard</h2>

		<div class="navbar">

			<a href="/user/dashboard">Home</a>

			<a href="/user/post">Create New Post</a>

			<a href="/user/profile">Profile</a>

			<a href="/logout">Logout</a>

		</div>

	</div>
	
	<% } %>

	<!-- Main -->

	<div class="container">
	
	<h4 style = "color: green">${update}</h4>

		<h2>Edit Post</h2>

		<form action="/user/edit" method="post">

			<label>Post ID</label>

			<input
				type="text"
				name = "id"
				class="input-box"
				value="${blog.id}"
				readonly>

			<label>Title</label>

			<input
				type="text"
				name="title"
				class="input-box"
				value="${blog.title}">

			<label>Author</label>

			<input
				type="text"
				name="fullName"
				class="input-box"
				readonly
				value="${blog.user.fullName}">

			<label>Content</label>

			<textarea name="content" class="input-box"> ${blog.content}
                 </textarea>

			<label>Status</label>

<%
	if("${role}".equals("ADMIN")){
	%>
			<select class="input-box" >

				<option>Published</option>

				<option>Pending</option>

				<option>Rejected</option>

			</select>
		<% } else { %>	
			<input
				type="text"
				name = "status"
				class="input-box"
				value="${status}" readonly>
 		<% } %>
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