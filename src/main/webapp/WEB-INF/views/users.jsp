<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Manage Users</title>

<link rel="stylesheet"
	href="style.css">

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

	<!-- Main -->

	<div class="container">

		<h2>Manage Users</h2>

		<table>

			<tr>

				<th>User ID</th>

				<th>Username</th>

				<th>Email</th>

				<th>Role</th>

				<th>Actions</th>

			</tr>

			<tr>

				<td>1</td>

				<td>Aman Shukla</td>

				<td>aman@gmail.com</td>

				<td>Admin</td>

				<td class="action-column">
					
					<a href="edit-user" class="action-link">
					<button class="btn blue">

						Edit

					</button>

					<button class="btn red">

						Delete

					</button>

				</td>

			</tr>

			<tr>

				<td>2</td>

				<td>John Doe</td>

				<td>john@gmail.com</td>

				<td>User</td>

				<td class="action-column">

			        <a href="edit-user" class="action-link">

					   <button class="btn blue">

						  Edit

				</button>

	        </a>

					  <button class="btn red">

						   Delete

			 </button>

		   </td>

			</tr>

			<tr>

				<td>3</td>

				<td>Rahul Sharma</td>

				<td>rahul@gmail.com</td>

				<td>User</td>

				<td class="action-column">

				    <a href="edit-user" class="action-link">

				        <button class="btn blue">

				            Edit

				        </button>

				    </a>

				    <button class="btn red">

				        Delete

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