<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Social Media Network</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f0f0f0;
        }

        .container {
            text-align: center;
            max-width: 600px;
        }

        h1 {
            color: #333;
        }

        p {
            color: #555;
            margin-top: 10px;
        }

        .animation-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .btn-container {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 0 10px;
            text-decoration: none;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .btn-signup {
            background-color: #3498db;
        }

        .btn-login {
            background-color: #27ae60;
        }

        .btn:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Our Social Media Network</h1>
    <p>Connect with friends and share your moments</p>
    <div class="btn-container">
        <a href="/SocialMN/user/signup" class="btn btn-signup">Sign Up</a>
        <a href="/SocialMN/user/login" class="btn btn-login">Sign In</a>
    </div>
</div>
</body>
</html>
