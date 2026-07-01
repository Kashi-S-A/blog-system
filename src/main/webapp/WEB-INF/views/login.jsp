<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Login Page</title>

<link rel="stylesheet"
	href="/style.css">

</head>

<body>

<div class="login-container">

	<h2>Login Page</h2>
	<h3 style="color: green">${succ}</h3>
	<h3 style="color: red">${err}</h3>
	
	<form action="/auth/login" method="post">

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

			<button
				type="submit"
				class="form-btn green">

				Login

			</button>

	</form>

	<div class="link">

		New User?

		<a href="/auth/register">

			Register Here

		</a>

	</div>

</div>

</body>
</html>