<%--<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>

<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>User Registration</title>--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>

<%--    <style>--%>
<%--        /* Add styles_signup.css to your project and link it in your HTML file */--%>
<%--        #signupform {--%>
<%--            max-width: 400px;--%>
<%--            margin: 20px auto;--%>
<%--            padding: 20px;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 8px;--%>
<%--            background-color: #fff;--%>
<%--            opacity: 0; /* Initially set opacity to 0 */--%>
<%--            animation: fadeIn 1s forwards; /* Use the fadeIn animation */--%>
<%--        }--%>

<%--        @keyframes fadeIn {--%>
<%--            from {--%>
<%--                opacity: 0;--%>
<%--            }--%>
<%--            to {--%>
<%--                opacity: 1;--%>
<%--            }--%>
<%--        }--%>
<%--        @keyframes pulse {--%>
<%--            0% {--%>
<%--                transform: scale(1);--%>
<%--            }--%>
<%--            50% {--%>
<%--                transform: scale(1.1);--%>
<%--            }--%>
<%--            100% {--%>
<%--                transform: scale(1);--%>
<%--            }--%>
<%--        }--%>

<%--        label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 8px;--%>
<%--        }--%>

<%--        input, select, textarea {--%>
<%--            width: 100%;--%>
<%--            padding: 8px;--%>
<%--            margin-bottom: 16px;--%>
<%--            box-sizing: border-box;--%>
<%--        }--%>

<%--        button {--%>
<%--            background-color: #4caf50;--%>
<%--            color: #fff;--%>
<%--            padding: 10px;--%>
<%--            border: none;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        button:hover {--%>
<%--            background-color: #45a049;--%>
<%--        }--%>

<%--        body {--%>
<%--            font-family: 'Arial', sans-serif;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            display: flex;--%>
<%--            align-items: center;--%>
<%--            justify-content: center;--%>
<%--            height: 100vh;--%>
<%--            background: url("https://cdn.pixabay.com/photo/2017/03/19/03/40/avatar-2155431_1280.png") center/cover no-repeat;--%>

<%--        }--%>


<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h2>User SignUp</h2>--%>
<%--    &lt;%&ndash;    <form id="signupform" action="/signup" method="post">&ndash;%&gt;--%>
<%--    <form action="/signup" id="signupform" method="post">--%>

<%--        <label for="username">Username:</label>--%>
<%--        <input type="text" id="username" name="username" required>--%>

<%--        <label for="password">Password:</label>--%>
<%--        <input type="password" id="password" name="password" required>--%>

<%--        <label for="fullname">Full Name:</label>--%>
<%--        <input type="text" id="fullname" name="fullname" required>--%>

<%--        <label for="dateOfBirth">Date of Birth:</label>--%>
<%--        <input type="date" id="dateOfBirth" name="dateOfBirth" required>--%>

<%--        <label for="gender">Gender:</label>--%>
<%--        <select id="gender" name="gender" required>--%>
<%--            <option value="male">Male</option>--%>
<%--            <option value="female">Female</option>--%>
<%--        </select>--%>

<%--        <label for="profilePicture">Profile Picture:</label>--%>
<%--        <input type="text" id="profilePicture" name="profilePicture">--%>

<%--        <label for="bio">Bio:</label>--%>
<%--        <textarea id="bio" name="bio" rows="4"></textarea>--%>

<%--        <label for="email">Email:</label>--%>
<%--        <input type="text" id="email" name="email" required>--%>

<%--        <button id="submitdata" type="button" onclick="signupUser()">Register</button>--%>
<%--    </form>--%>
<%--</div>--%>
<%--<script src="<c:url value="/resource/support/js/appjs/signup.js"/>"></script>--%>

<%--</body>--%>
<%--</html>--%>

<%--*************************************************************--%>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
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
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)), url("https://cdn.pixabay.com/photo/2017/03/19/03/40/avatar-2155431_1280.png") center/cover no-repeat;
            background-blend-mode: overlay;
            color: #fff;
        }

        .container {
            text-align: center;
            max-width: 800px;
            margin: 50px auto; /* Increased margin for better spacing */
            padding: 40px; /* Increased padding for a larger container */
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: rgba(255, 255, 255, 0.9);
            opacity: 0;
            animation: fadeIn 1s forwards;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        h2 {
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
<div class="container">
    <h2>User SignUp</h2>
    <form action="/signup" id="signupform" method="post">
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
        <input type="text" id="profilePicture" name="profilePicture">

        <label for="bio">Bio:</label>
        <textarea id="bio" name="bio" rows="4"></textarea>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email" required>

        <button id="submitdata" type="button" onclick="signupUser()">Register</button>
    </form>
</div>
<script src="<c:url value="/resource/support/js/appjs/signup.js"/>"></script>

</body>
</html>
