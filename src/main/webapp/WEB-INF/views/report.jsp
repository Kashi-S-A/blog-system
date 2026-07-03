<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Reports</title>

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

	<!-- Main Content -->

	<div class="container">

		<h2>Reports</h2>

		<h2>Reports</h2>

		<form action="#" method="post">

			<label>Select Report</label>

			<select class="input-box">

				<option>Most Active Users</option>

				<option>Pending Posts</option>

			</select>

			<button
				type="submit"
				class="form-btn black">

				Generate Report

			</button>

		</form>
	</div>

	<!-- Footer -->

	<div class="footer">

		© 2026 Blog Platform

	</div>

</body>
</html>