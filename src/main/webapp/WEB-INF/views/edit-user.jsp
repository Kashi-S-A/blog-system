<%@page import="com.blog.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit User</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

	<!-- Header -->

	<div class="header">
		<h2>Admin Blog Dashboard</h2>

		<div class="navbar">

			<a href="/admin/dashboard">Manage Posts</a>

			<a href="/admin/users">Manage Users</a>

			<a href="/admin/post-mod">Post Moderation</a>

			<a href="/admin/reports">Reports</a>

			<a href="/logout">Logout</a>

		</div>

	</div>

	<!-- Main -->
	<%
		User user = (User)request.getAttribute("user");
	%>

	<div class="container">

		<h2>Edit User</h2>

		<form action="edit-user" method="post">

			<label>User ID</label>

			<input
				type="text"
				name="id"
				class="input-box"
				value="<%=user.getId() %>"
				readonly>

			<label>Username</label>

			<input
				type="text"
				name="username"
				class="input-box"
				value="<%=user.getUsername()%>">

			<label>Email</label>

			<input
				type="email"
				name="email"
				class="input-box"
				value="<%=user.getEmail() %>">

			<label>Role</label>

			<select name="role" class="input-box">
			
				<option value="USER">USER</option>

				<option value="ADMIN">ADMIN</option>

			</select>

			<button
				type="submit"
				class="form-btn blue">

				Update User

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