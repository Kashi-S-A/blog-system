<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.blog.entity.Blog"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>User Profile</title>

<link rel="stylesheet" href="/style.css">

</head>

<body>

	<!-- Header -->

	<div class="header">

		<h2>Blog Dashboard</h2>

		<div class="navbar">

			<a href="/user/dashboard">Home</a> <a href="/user/post">Create
				New Post</a> <a href="/user/profile">Profile</a>

		</div>

	</div>

	<!-- Main -->

	<div class="container">
		
		<h4 style = "color: green">${delete_msg}</h4>
		<h2>User Profile</h2>

		<div class="post">

			<p>
				<b>Name :</b> ${user.fullName}
			</p>

			<p>
				<b>Username :</b> ${user.username}
			</p>

			<p>
				<b>Email :</b> ${user.email}
			</p>

			<p>
				<b>Role :</b> ${user.role}
			</p>

		</div>

		<h2 style="margin-top: 25px;">My Blog Posts</h2>

		<%
		List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
		%>

		<table>
			<tr>
				<th>Title</th>
				<th>Date</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
			<%
			if (blogs != null && !blogs.isEmpty()) {
				for (Blog blog : blogs) {
			%>
			<tr>
				<td><%=blog.getTitle()%></td>
				<td><%=blog.getCreatedDate() != null ? blog.getCreatedDate().format(formatter) : ""%>
				<td><%=blog.getStatus()%>
				</td>
				<td class="action-column"><a
					href="edit-blog?id=<%=blog.getId()%>"
					style="text-decoration: none;">
						<button class="btn blue">Edit</button>
				</a> <a href="/user/profile?id=<%=blog.getId()%>"
					style="text-decoration: none;">
						<button class="btn red">Delete</button>
				</a></td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="3" style="text-align: center;">No blogs found.</td>
			</tr>
			<%
			}
			%>
		</table>

		<form action="/logout">
			<button type="submit" class="form-btn black">Logout</button>
		</form>

	</div>

	<!-- Footer -->

	<div class="footer">© 2026 Blog Platform</div>

</body>
</html>