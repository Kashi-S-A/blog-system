<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Manage Posts</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

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

	<div class="container">

		<h2>Manage Posts</h2>

		<table>

			<tr>

				<th>Post ID</th>

				<th>Title</th>

				<th>Author</th>

				<th>Status</th>

				<th>Actions</th>

			</tr>

			<tr>

				<td>101</td>

				<td>Spring Boot Basics</td>

				<td>Aman Shukla</td>

				<td>Published</td>

				<td class="action-column">

					<a href="edit-post" class="action-link">

						<button type="button" class="btn blue">
							Edit
						</button>

					</a>

					<button type="button" class="btn red">
						Delete
					</button>

					<button type="button" class="btn green">
						Feature
					</button>

				</td>

			</tr>

			<tr>

				<td>102</td>

				<td>Java Collection Framework</td>

				<td>John Doe</td>

				<td>Published</td>

				<td class="action-column">

					<a href="edit-post" class="action-link">

						<button type="button" class="btn blue">
							Edit
						</button>

					</a>

					<button type="button" class="btn red">
						Delete
					</button>

					<button type="button" class="btn green">
						Feature
					</button>

				</td>

			</tr>

			<tr>

				<td>103</td>

				<td>JSP Basics</td>

				<td>Rahul Sharma</td>

				<td>Pending</td>

				<td class="action-column">

					<a href="edit-post" class="action-link">

						<button type="button" class="btn blue">
							Edit
						</button>
					</a>

					<button type="button" class="btn red">
						Delete
					</button>

					<button type="button" class="btn green">
						Feature
					</button>
				</td>
			</tr>

		</table>

	</div>

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>