<%@page import="java.util.List"%>
<%@page import="com.blog.entity.Blog"%>
<%@page import="org.springframework.data.domain.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
 
<title>Post Moderation</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

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
	
	<!-- Main Content -->

	<div class="container">

		<h2>Manage Blog Posts</h2>

		<table>

			<tr>

				<th>Title</th>

				<th>Author</th>

				<th>Date</th>

				<th>Status</th>
				
				<th>Actions</th>

			</tr>
	<%
		Page<Blog> pages =(Page<Blog>) request.getAttribute("blogs");
		if(!pages.isEmpty())
		{
			List<Blog> blogs = pages.getContent();
		for(Blog blog : blogs)
		{
	%>

			<tr>

				<td><%=blog.getTitle() %></td>

				<td><%=blog.getUser().getFullName()%></td>

				<td><%=blog.getCreatedDate() %></td>

				<td><%=blog.getStatus() %></td>

				<td class="action-column">

					<button type="button" class="btn green">
						Approve
					</button>

					<button type="button" class="btn blue">
						Reject
					</button>

					<button type="button" class="btn red">
						Remove
					</button>

				</td>
			</tr>

	<%}} %>
		</table>

		
	<%
		if(pages.hasPrevious())
		{
	%>
	<a href="/admin/dashboard?pageno=<%= pages.getNumber()-1%>">
	<button class="button" >
		&laquo; Previous
	</button>
	</a>
	<%
		}
		if(pages.hasNext())
		{
	%>
	<a href="/admin/dashboard?pageno=<%= pages.getNumber()+1%>">
	<button class="button" >
		 Next &raquo;
	</button>
	</a>
	<%
		}
	%>

	</div>

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>