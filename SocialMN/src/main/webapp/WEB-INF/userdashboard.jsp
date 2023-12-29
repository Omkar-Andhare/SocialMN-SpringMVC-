<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
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
            background: url("https://cdn.pixabay.com/photo/2017/03/19/03/40/avatar-2155431_1280.png") center/cover no-repeat;
        }


        .profile-container {
            padding: 20px;
            text-align: left;
            width: 300px;
            position: fixed;
            top: 10px;
            left: 10px;
        }


        h1 {
            margin-bottom: 20px;
            color: #333;
        }

        p {
            margin-bottom: 10px;
            color: #555;
        }

        span {
            font-weight: bold;
            color: #333;
        }

        img {
            max-width: 100%;
            border-radius: 8px;
            margin-bottom: 10px;
        }


        .friend-list {
            margin: auto;
            text-align: center;
            position: absolute;
            top: 40px;
            right: 30px;
            transform: translate(0, 0);
        }


        .friends-button {
            background-color: #3498db;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            float: right;
        }

        .logout-button {
            background-color: red;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            float: left;
        }


        .friends-button:hover {
            background-color: #2980b9;
        }

        .friend-list-items {
            margin: auto;
            text-align: center;
            position: absolute;
            top: 40px; /* Adjusted to move it to the top */
            left: 50%;
            transform: translateX(-50%);
        }

        .suggested-friend-list {
            display: flex;
            flex-direction: column;
        }


    </style>
</head>
<body>
<div class="profile-container">
    <h1>User Dashboard</h1>
    <p>Username: <span id="usernameSpan"></span></p>
    <p>Full Name: <span id="fullNameSpan"></span></p>
    <p>Date of Birth: <span id="dobSpan"></span></p>
    <p>Profile Picture:</p>
    <img id="profilePicture" src="" alt="Profile Picture">
    <p>Bio: <span id="bioSpan"></span></p>
    <p>Email: <span id="emailSpan"></span></p>
    <button id="logoutButton" class="logout-button" onclick="logout()">Logout</button>
</div>
<div class="suggested-friend-list">
    <h2>Suggested Friend List</h2>
    <ul id="friendList" class="friend-list-items"></ul>
</div>
<div class="friend-list">
    <h2>Your Friends</h2>
    <ul id="userFriendsList"></ul>
    <button class="friends-button" onclick="loadUserFriends()">Your Friends</button>
</div>
</body>
<script src="<c:url value="/resource/support/js/appjs/userdashboard.js"/>"></script>
</html>
