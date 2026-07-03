<%@page import="com.blog.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Manage Users</title>

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
		List<User> users = (List<User>) request.getAttribute("users");
	%>

	<div class="container">
	<h4 style="color: green">${msg}</h4>
		<h2>Manage Users</h2>

		<table>

			<tr>

				<th>User ID</th>

				<th>Username</th>

				<th>Email</th>

				<th>Role</th>

				<th>Actions</th>

			</tr>

			<%
				if(!users.isEmpty())
				{ 
					for(User user : users)
					{
			%>
			<tr>

				<td><%=user.getId() %></td>

				<td><%=user.getFullName() %></td>

				<td><%=user.getEmail() %></td>

				<td><%=user.getRole()%></td>

				<td class="action-column">
					
					<a href="edit-user?uid=<%= user.getId()%>" class="action-link">
					<button class="btn blue">

						Edit

					</button>
					</a>
					
					<a href="/admin/delete?uid=<%= user.getId()%>">
					<button class="btn red">

						Delete

					</button>
					</a>
					
				</td>

			</tr>
			<%		}
			
				}
			%>
		</table>

	</div>

	<!-- Footer -->

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>