<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

	<!-- Header -->

	<div class="header">

		<h2>Admin Blog Dashboard</h2>

		<div class="navbar">

			<a href="admin-dashboard">Manage Posts</a>

			<a href="users">Manage Users</a>

			<a href="post-moderation">Post Moderation</a>

			<a href="report">Reports</a>

			<a href="login">Logout</a>

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

			<tr>

				<td>Spring Boot Basics</td>

				<td>Aman Shukla</td>

				<td>29-06-2026</td>

				<td>Published</td>

				<td class="action-column">

					<button class="btn blue">

						Edit

					</button>

					<button class="btn red">

						Delete

					</button>

					<button class="btn green">

						Feature

					</button>

				</td>

			</tr>

			<tr>

				<td>Java Collection Framework</td>

				<td>John Doe</td>

				<td>28-06-2026</td>

				<td>Published</td>

				<td class="action-column">

					<button class="btn blue">

						Edit

					</button>

					<button class="btn red">

						Delete

					</button>

					<button class="btn green">

						Feature

					</button>

				</td>

			</tr>

		</table>

	</div>

	<!-- Footer -->

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>