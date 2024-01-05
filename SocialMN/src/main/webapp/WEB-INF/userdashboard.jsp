<%--<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>User Dashboard</title>--%>
<%--    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>--%>
<%--    <style>--%>


<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background: url('https://cdn.pixabay.com/photo/2017/03/19/03/40/avatar-2155431_1280.png') center/cover no-repeat fixed;--%>
<%--            margin: 0;--%>
<%--            padding: 20px;--%>
<%--            color: #fff;--%>
<%--        }--%>

<%--        .container {--%>
<%--            display: flex;--%>
<%--            justify-content: space-around;--%>
<%--            max-width: 1200px;--%>
<%--            margin: 20px auto;--%>
<%--        }--%>

<%--        .profile-container, .suggested-friend-list, .friend-list {--%>
<%--            background-color: rgba(0, 0, 0, 0.5);--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 8px;--%>
<%--            padding: 20px;--%>
<%--            flex: 1;--%>
<%--            margin: 0 10px;--%>
<%--        }--%>

<%--        .profile-container h1 {--%>
<%--            color: #fff;--%>
<%--        }--%>

<%--        .profile-container img {--%>
<%--            max-width: 100%;--%>
<%--            height: auto;--%>
<%--            margin-bottom: 10px;--%>
<%--        }--%>

<%--        .profile-container p {--%>
<%--            margin: 8px 0;--%>
<%--        }--%>


<%--        .logout-button {--%>
<%--            background-color: #e74c3c;--%>
<%--            color: #fff;--%>
<%--            padding: 10px;--%>
<%--            border: none;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        .logout-button:hover {--%>
<%--            background-color: #c0392b;--%>
<%--        }--%>


<%--        .suggested-friend-list h1 {--%>
<%--            color: #fff;--%>
<%--            font-size: 24px;--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>

<%--        .friend-list-items {--%>
<%--            list-style-type: none;--%>
<%--            padding: 0;--%>
<%--            margin-top: 10px;--%>
<%--        }--%>

<%--        .list-item {--%>
<%--            margin-bottom: 15px;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .add-button {--%>
<%--            background-color: #4caf50;--%>
<%--            color: #fff;--%>
<%--            padding: 7px;--%>
<%--            border: none;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--            position: absolute;--%>
<%--            right: 0;--%>
<%--            top: 0;--%>
<%--        }--%>

<%--        .add-button:hover {--%>
<%--            background-color: #45a049;--%>
<%--        }--%>


<%--        .friends-button {--%>
<%--            background-color: #3498db;--%>
<%--            color: #fff;--%>
<%--            padding: 10px;--%>
<%--            border: none;--%>
<%--            border-radius: 4px;--%>
<%--            cursor: pointer;--%>
<%--            margin-top: 15px;--%>
<%--        }--%>

<%--        .friends-button:hover {--%>
<%--            background-color: #2980b9;--%>
<%--        }--%>


<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <div class="profile-container">--%>
<%--        <h1>Profile</h1>--%>
<%--        <p>Username: <span id="usernameSpan"></span></p>--%>
<%--        <p>Full Name: <span id="fullNameSpan"></span></p>--%>
<%--        <p>Date of Birth: <span id="dobSpan"></span></p>--%>
<%--        <p>Profile Picture:</p>--%>
<%--        <img id="profilePicture" src="" alt="Profile Picture">--%>
<%--        <p>Bio: <span id="bioSpan"></span></p>--%>
<%--        <p>Email: <span id="emailSpan"></span></p>--%>
<%--        <button id="logoutButton" class="logout-button" onclick="logout()">Logout</button>--%>
<%--    </div>--%>
<%--    <div class="suggested-friend-list">--%>
<%--        <h1>Suggested Friend List</h1>--%>
<%--        <ul id="friendList" class="friend-list-items"></ul>--%>
<%--    </div>--%>
<%--    <div class="friend-list">--%>
<%--        <h1>Friends</h1>--%>
<%--        <ul id="userFriendsList"></ul>--%>
<%--        <button class="friends-button" onclick="loadUserFriends()">Your Friends</button>--%>
<%--    </div>--%>
<%--    <div id="mutualFriendsContainer">--%>
<%--        <h2>Mutual Friends</h2>--%>
<%--        <ul id="mutualFriendsList" onclick="displayMutualFriends()"></ul>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--<script src="<c:url value="/resource/support/js/appjs/userdashboard.js"/>"></script>--%>
<%--</html>--%>

<%--******************************************************************************************************--%>
<%--<div class="container">--%>
<%--    <div class="profile-container">--%>
<%--        <h1>Profile</h1>--%>
<%--        <p>Username: <span id="usernameSpan"></span></p>--%>
<%--        <p>Full Name: <span id="fullNameSpan"></span></p>--%>
<%--        <p>Date of Birth: <span id="dobSpan"></span></p>--%>
<%--        <p>Profile Picture:</p>--%>
<%--        <img id="profilePicture" src="" alt="Profile Picture">--%>
<%--        <p>Bio: <span id="bioSpan"></span></p>--%>
<%--        <p>Email: <span id="emailSpan"></span></p>--%>
<%--        <button id="logoutButton" class="logout-button" onclick="logout()">Logout</button>--%>
<%--    </div>--%>
<%--    <div class="friend-list-container">--%>
<%--        <div class="suggested-friend-list">--%>
<%--            <h1>Suggested Friend List</h1>--%>
<%--            <ul id="friendList" class="friend-list-items"></ul>--%>
<%--        </div>--%>
<%--        <div class="friend-list">--%>
<%--            <h1>Friends</h1>--%>
<%--            <ul id="userFriendsList"></ul>--%>
<%--            <button class="friends-button" onclick="loadUserFriends()">Your Friends</button>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<style>body {--%>
<%--    font-family: Arial, sans-serif;--%>
<%--    background: url('https://cdn.pixabay.com/photo/2017/03/19/03/40/avatar-2155431_1280.png') center/cover no-repeat fixed;--%>
<%--    margin: 0;--%>
<%--    padding: 20px;--%>
<%--    color: #fff;--%>
<%--}--%>

<%--.container {--%>
<%--    display: flex;--%>
<%--    flex-direction: column;--%>
<%--    max-width: 1200px;--%>
<%--    margin: 20px auto;--%>
<%--}--%>

<%--.profile-container {--%>
<%--    background-color: rgba(0, 0, 0, 0.5);--%>
<%--    border: 1px solid #ccc;--%>
<%--    border-radius: 8px;--%>
<%--    padding: 20px;--%>
<%--    margin-bottom: 20px;--%>
<%--}--%>

<%--.profile-container h1 {--%>
<%--    color: #fff;--%>
<%--}--%>

<%--.profile-container img {--%>
<%--    max-width: 100%;--%>
<%--    height: auto;--%>
<%--    margin-bottom: 10px;--%>
<%--}--%>

<%--.profile-container p {--%>
<%--    margin: 8px 0;--%>
<%--}--%>

<%--.friend-list-container {--%>
<%--    display: flex;--%>
<%--    justify-content: space-between;--%>
<%--}--%>

<%--.suggested-friend-list,--%>
<%--.friend-list {--%>
<%--    background-color: rgba(0, 0, 0, 0.5);--%>
<%--    border: 1px solid #ccc;--%>
<%--    border-radius: 8px;--%>
<%--    padding: 20px;--%>
<%--    flex: 1;--%>
<%--    margin: 0 10px;--%>
<%--}--%>

<%--.suggested-friend-list h1,--%>
<%--.friend-list h1 {--%>
<%--    color: #fff;--%>
<%--    font-size: 24px;--%>
<%--    margin-bottom: 15px;--%>
<%--}--%>

<%--.friend-list-items {--%>
<%--    list-style-type: none;--%>
<%--    padding: 0;--%>
<%--    margin-top: 10px;--%>
<%--}--%>

<%--.list-item {--%>
<%--    margin-bottom: 15px;--%>
<%--    position: relative;--%>
<%--}--%>

<%--.add-button {--%>
<%--    background-color: #4caf50;--%>
<%--    color: #fff;--%>
<%--    padding: 7px;--%>
<%--    border: none;--%>
<%--    border-radius: 4px;--%>
<%--    cursor: pointer;--%>
<%--    position: absolute;--%>
<%--    right: 0;--%>
<%--    top: 0;--%>
<%--}--%>

<%--.add-button:hover {--%>
<%--    background-color: #45a049;--%>
<%--}--%>

<%--.friends-button {--%>
<%--    background-color: #3498db;--%>
<%--    color: #fff;--%>
<%--    padding: 10px;--%>
<%--    border: none;--%>
<%--    border-radius: 4px;--%>
<%--    cursor: pointer;--%>
<%--    margin-top: 15px;--%>
<%--}--%>

<%--.friends-button:hover {--%>
<%--    background-color: #2980b9;--%>
<%--}--%>

<%--.suggested-friend-list,--%>
<%--.friend-list {--%>
<%--    width: 48%; /* Adjust the width as needed */--%>
<%--}--%>
<%--</style>--%>

<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>

        body {
            font-family: Arial, sans-serif;
            background: url('https://cdn.pixabay.com/photo/2017/03/19/03/40/avatar-2155431_1280.png') center/cover no-repeat fixed;
            margin: 0;
            padding: 20px;
            color: #fff;
        }


        .profile-container {
            position: relative;
        }

        .logout-button {
            position: absolute;
            top: 5px;
            right: 5px;
            padding: 5px;
            font-size: 12px;
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            transition: transform 0.2s ease-in-out;
        }

        .logout-button:hover {
            transform: scale(1.1);
        }


        .container {
            display: flex;
            flex-direction: column;
            max-width: 1200px;
            margin: 20px auto;
        }

        .profile-container {
            background-color: rgba(0, 0, 0, 0.5);
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .profile-container h1 {
            color: #fff;
        }

        .profile-container img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .profile-container p {
            margin: 8px 0;
        }

        .friend-list-container {
            display: flex;
            justify-content: space-between;
        }

        .suggested-friend-list,
        .friend-list {
            background-color: rgba(0, 0, 0, 0.5);
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            flex: 1;
            margin: 0 10px;
        }

        .suggested-friend-list h1,
        .friend-list h1 {
            color: #fff;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .friend-list-items {
            list-style-type: none;
            padding: 0;
            margin-top: 10px;
        }

        .list-item {
            margin-bottom: 15px;
            position: relative;
        }

        .add-button {
            background-color: #4caf50;
            color: #fff;
            padding: 7px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            position: absolute;
            right: 0;
            top: 0;
        }

        .add-button:hover {
            background-color: #45a049;
        }

        .friends-button {
            background-color: #3498db;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 15px;
        }

        .friends-button:hover {
            background-color: #2980b9;
        }

        .suggested-friend-list,
        .friend-list {
            width: 48%; /* Adjust the width as needed */
        }

        .friend-list {
            background-color: rgba(0, 0, 0, 0.5);
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            margin: 0 10px;
            flex: 1;
        }

        .friends-list {
            list-style-type: none;
            padding: 0;
            margin-top: 10px;
        }

        .list-item {
            margin-bottom: 15px;
            position: relative;
        }

        .remove-button, .mutual-button {
            background-color: #e74c3c;
            color: #fff;
            padding: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;        }

        .remove-button:hover, .mutual-button:hover {
            background-color: #c0392b;
        }

    </style>
</head>
<script src="<c:url value="/resource/support/js/appjs/userdashboard.js"/>"></script>

<body>
<div class="profile-container">
    <h1>Profile</h1>
    <p>Username: <span id="usernameSpan"></span></p>
    <p>Full Name: <span id="fullNameSpan"></span></p>
    <p>Date of Birth: <span id="dobSpan"></span></p>
    <p>Profile Picture:</p>
    <img id="profilePicture" src="" alt="Profile Picture">
    <p>Bio: <span id="bioSpan"></span></p>
    <p>Email: <span id="emailSpan"></span></p>
    <button id="logoutButton" class="logout-button" onclick="logout()">Logout</button>
</div>
<div class="friend-list-container">
    <div class="suggested-friend-list">
        <h1>Suggested Friend List</h1>
        <ul id="friendList" class="friend-list-items"></ul>
    </div>
    <div class="friend-list">
        <h1>Friends</h1>
        <ul id="userFriendsList" class="friends-list"></ul>
        <button class="friends-button" onclick="loadUserFriends()">Your Friends</button>
    </div>

</div>
</div>
</body>
<script src="<c:url value="/resource/support/js/appjs/userdashboard.js"/>"></script>
</html>