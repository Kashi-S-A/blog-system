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

			<a href="#">Manage Posts</a>

			<a href="#">Manage Users</a>

			<a href="#">Post Moderation</a>

			<a href="#">Reports</a>

			<a href="/logout">Logout</a>

		</div>

	</div>

	<!-- Main -->

	<div class="container">

		<h2>Edit User</h2>

		<form action="#" method="post">

			<label>User ID</label>

			<input
				type="text"
				class="input-box"
				value="1"
				readonly>

			<label>Username</label>

			<input
				type="text"
				class="input-box"
				value="Aman Shukla">

			<label>Email</label>

			<input
				type="email"
				class="input-box"
				value="aman@gmail.com">

			<label>Role</label>

			<select class="input-box">

				<option>Admin</option>

				<option>User</option>

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