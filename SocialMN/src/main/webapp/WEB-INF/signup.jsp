<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
    <h2>User SignUp</h2>
    <%--    <form id="signupform" action="/signup" method="post">--%>
    <form action="/signup" id="signupform"  method="post" >

        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="fullname">Full Name:</label>
        <input type="text" id="fullname" name="fullname" required>

        <label for="dateOfBirth">Date of Birth:</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth" required>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="male">Male</option>
            <option value="female">Female</option>
        </select>

        <label for="profilePicture">Profile Picture:</label>
        <input type="text" id="profilePicture" name="profilePicture" >

        <label for="bio">Bio:</label>
        <textarea id="bio" name="bio" rows="4"></textarea>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>

        <button id="submitdata" type="button" onclick="signupUser()">Register</button>
    </form>
</div>
<script>

    function signupUser() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;
        var fullname = document.getElementById('fullname').value;
        var dateOfBirth = document.getElementById('dateOfBirth').value;
        var gender = document.getElementById('gender').value;
        var profilePicture = document.getElementById('profilePicture').value;
        var bio = document.getElementById('bio').value;
        var email = document.getElementById('email').value;


        var userData = {
            "username": username,
            "password": password,
            "fullname": fullname,
            "dateOfBirth": dateOfBirth,
            "gender": gender,
            "profilePicture": profilePicture,
            "bio": bio,
            "email": email
        };

        $.ajax({
            type: "POST",
            url: "/SocialMN/user/signup",
            contentType: "application/json",
            data: JSON.stringify(userData),
            success: function () {
                alert("Sign Up successfully..!");
                window.location.href = "/SocialMN/user/login";


            },
            error: function () {
                alert("sign up failed ");
            }
        });


    }
</script>
</body>
</html>
