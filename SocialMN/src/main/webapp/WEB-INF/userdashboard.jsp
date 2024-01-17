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

        .view-friendsButton, .view-profile-button, .mutual-button {
            background-color: #ff9800;
            color: #fff;
            padding: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        .view-friendsButton:hover,
        .view-profile-button:hover,
        .mutual-button:hover {
            background-color: #e08000; /* Slightly darker shade on hover */
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

        .remove-button {
            background-color: #e74c3c;
            color: #fff;
            padding: 5px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        .remove-button:hover {
            background-color: #c0392b;
        }

        /* Popup styles */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* Black with 50% opacity */
            z-index: 999;
        }

        .popup-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #292a2d; /* Dark gray background */
            padding: 30px;
            border-radius: 12px;
            max-width: 600px;
            width: 100%;
            text-align: left;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            color: #fff; /* Text color */
        }

        .popup-content h1 {
            font-size: 28px;
            color: #f39c12; /* Header color */
            margin-bottom: 20px;
        }

        .popup-content p {
            margin: 12px 0;
            font-size: 16px;
            line-height: 1.5;
        }

        .popup-content span {
            font-weight: bold;
            color: #3498db; /* Accent color */
        }

        .close {
            position: absolute;
            top: 15px;
            right: 15px;
            cursor: pointer;
            font-size: 20px;
            color: #e74c3c; /* Close button text color */
        }

        .close:hover {
            color: #c0392b; /* Close button text color on hover */
        }

        .popup-content form {
            display: flex;
            flex-direction: column;
        }

        .popup-content .form-group {
            margin-bottom: 15px;
        }

        .popup-content label {
            margin-bottom: 5px;
        }

        .update-profile-button {
            background-color: #3498db;
            color: #fff;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .update-profile-button:hover {
            background-color: #2980b9;
        }


    </style>
</head>
<script src="<c:url value="/resource/support/js/appjs/userdashboard.js"/>"></script>

<body>
<div class="profile-container">
    <h1>Profile</h1>
    <%--    <p>Profile Picture:</p>--%>
    <img id="profilePicture" src="" alt="Profile Picture" style="width: 200px; height: 200px; border-radius: 50%;">
    <p>Username: <span id="usernameSpan"></span></p>
    <p>Full Name: <span id="fullNameSpan"></span></p>
    <p>Date of Birth: <span id="dobSpan"></span></p>

    <p>Bio: <span id="bioSpan"></span></p>
    <p>Email: <span id="emailSpan"></span></p>
    <button id="editProfileButton" class="update-profile-button">Edit</button>

    <button id="logoutButton" class="logout-button" onclick="logout()">Logout</button>
</div>

<!-- pop up for updating info -->
<div id="updateProfileForm" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('updateProfileForm')">&times;</span>
        <h1>Update Profile</h1>
        <form id="profileUpdateForm">

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="username" required
                       onchange="checkUsernameExistence()" class="username-input">
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Abc%1234 length must be > 8" required>
            </div>

            <div class="form-group">

                <label for="fullname">Full Name:</label>
                <input type="text" id="fullname" name="fullname" placeholder="full Name" required>
            </div>


            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <input type="date" id="dateOfBirth" name="dateOfBirth" required>
            </div>
            <label for="profilePicture">Profile Picture:</label>
            <input type="file" id="updateProfilePicture" name="profilePicture" accept="image/*">

            <div class="form-group">
                <label for="bio">Bio:</label>
                <textarea id="bio" name="bio" rows="4"></textarea>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="text" id="email" name="email" placeholder="abc@gmail.com" required
                       onchange="checkEmailExistence()">
            </div>

            <label for="gender">Gender:</label>
            <select id="gender" name="gender" required>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>


            <div class="form-group">
                <input type="button" value="Update Profile" onclick="updateProfile()">
            </div>
        </form>
    </div>
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

<!-- Popup for user profile -->
<div id="profilePopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('profilePopup')">&times;</span>
        <div id="profileContent"></div>
    </div>
</div>

<!-- Popup for viewing friend list -->
<div id="friendListPopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('friendListPopup')">&times;</span>
        <div id="friendListContent"></div>
    </div>
</div>

<!-- Popup for displaying mutual friends -->
<div id="mutualFriendsPopup" class="popup">
    <div class="popup-content">
        <span class="close" onclick="closePopup('mutualFriendsPopup')">&times;</span>
        <div id="mutualFriendsContent"></div>
    </div>
</div>

</body>
<script src="<c:url value="/resource/support/js/appjs/userdashboard.js"/>"></script>
<script src="<c:url value="/resource/support/js/appjs/signup.js"/>"></script>

</html>