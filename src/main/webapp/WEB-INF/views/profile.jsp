<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>User Profile</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

	<!-- Header -->

	<div class="header">

		<h2>Blog Dashboard</h2>

		<div class="navbar">

			<a href="/user/dashboard">Home</a>

			<a href="/user/post">Create New Post</a>

			<a href="#">Profile</a>

		</div>

	</div>

	<!-- Main -->

	<div class="container">

		<h2>User Profile</h2>

		<div class="post">

			<p><b>Name :</b> Aman Shukla</p>

			<p><b>Username :</b> aman246</p>

			<p><b>Email :</b> aman@gmail.com</p>

			<p><b>Role :</b> User</p>

		</div>

		<h2 style="margin-top:25px;">My Blog Posts</h2>

		<table>

			<tr>

				<th>Title</th>

				<th>Date</th>

				<th>Actions</th>

			</tr>

			<tr>

				<td>Spring Boot Basics</td>

				<td>29-06-2026</td>

				<td class="action-column">

					<button class="btn blue">

						Edit

					</button>

					<button class="btn red">

						Delete

					</button>

				</td>

			</tr>

			<tr>

				<td>Java Collection Framework</td>

				<td>28-06-2026</td>

				<td class="action-column">

					<button class="btn blue">

						Edit

					</button>

					<button class="btn red">

						Delete

					</button>

				</td>

			</tr>

		</table>

		<form action="/logout">
		    <button type="submit" class="form-btn black">
		        Logout
		    </button>
		</form>

	</div>

	<!-- Footer -->

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>