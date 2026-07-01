<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Registration Page</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

	<div class="login-container">

		<h2>Registration</h2>

		<form action="/auth/register" method="post">

			<label>Username</label>

			<input
				type="text"
				name="username"
				class="input-box"
				placeholder="Enter Username">

			<label>Password</label>

			<input
				type="password"
				name="password"
				class="input-box"
				placeholder="Enter Password">

			<label>Email</label>

			<input
				type="email"
				name="email"
				class="input-box"
				placeholder="Enter Email">

			<label>Full Name</label>

			<input
				type="text"
				name="fullName"
				class="input-box"
				placeholder="Enter Full Name">

			<button
				type="submit"
				class="form-btn blue">

				Register

			</button>

		</form>

		<div class="link">

			Already have an account?

			<a href="/auth/login">

				Login Here

			</a>

		</div>

	</div>

</body>
</html>