<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #3498db;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>User Login</h2>
    <form id="loginForm" action="/signin" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <button type="button" onclick="loginUser()">Login</button>
    </form>
</div>


<script>
    function loginUser() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;

        sessionStorage.setItem("username", username);
        sessionStorage.setItem("password", password);


        var userData = {
            "username": username,
            "password": password
        };

        $.ajax({
            type: "POST",
            url: "/SocialMN/user/login",
            contentType: "application/json",
            data: JSON.stringify(userData),
            success: function () {
                // alert("Login successfully!");
                window.location.href = "/SocialMN/user/userdashboard";
            },
            error: function () {
                alert("Login failed. Please check your username and password.");
            }
        });
    }
</script>
<%--<script src="<c:url value="/resource/support/js/appjs/login.js"/>"></script>--%>
</body>
</html>


