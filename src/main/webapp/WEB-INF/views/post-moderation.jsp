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


			<a href="#">Manage Posts</a>
			
			<a href="#">Manage Users</a>

			<a href="#">Post Moderation</a>

			<a href="#">Reports</a>

			<a href="/logout">Logout</a>

		</div>

	</div>

	<div class="container">

		<h2>Post Moderation</h2>

		<table>

			<tr>

				<th>Title</th>

				<th>Author</th>

				<th>Date</th>

				<th>Status</th>

				<th>Actions</th>

			</tr>

			<tr>

				<td>Artificial Intelligence</td>

				<td>Aman Shukla</td>

				<td>30-06-2026</td>

				<td>Pending Approval</td>

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

			<tr>

				<td>Cloud Computing</td>

				<td>John Doe</td>

				<td>29-06-2026</td>

				<td>Pending Approval</td>

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

		</table>

	</div>

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>