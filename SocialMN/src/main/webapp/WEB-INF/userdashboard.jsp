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

        .list-item {
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        .add-button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            padding: 5px 10px;
            border: none;
            border-radius: 4px;
        }

        .list-item {
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .friend-list {
            margin: auto;
            text-align: center;
            position: absolute;
            top: 40px; /* Set your preferred top margin */
            right: 30px; /* Adjusted right margin to move it a bit to the left */
            transform: translate(0, 0);
        }


        .suggested-friend-list {
            text-align: center;
            position: absolute;
            top: 30px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #fff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .suggested-friend-list h2 {
            margin-bottom: 4px; /* Add margin to the bottom of the h2 element */
        }

        .friend-list-items {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .friend-list-items li {
            margin-bottom: 15px; /* Adjust the margin as needed */
            margin: 50px 0 0 0; /* Add top margin to move the list down */

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
<%--<h1>User Dashboard</h1>--%>


<%--<div class="dashboard-container">--%>
<%--    <div class="profile-point"></div>--%>

<%--    <p>Username: <span id="usernameSpan"></span></p>--%>
<%--    <p>Full Name: <span id="fullNameSpan"></span></p>--%>
<%--    <p>Date of Birth: <span id="dobSpan"></span></p>--%>
<%--    <p>Profile Picture:</p>--%>
<%--    <img id="profilePicture" src="" alt="Profile Picture">--%>

<%--    <p>Bio: <span id="bioSpan"></span></p>--%>
<%--    <p>Email: <span id="emailSpan"></span></p>--%>
<%--    <button id="logoutButton" onclick="logout()">Logout</button>--%>
<%--    <button class="friends-button" onclick="loadUserFriends()">Your Friends</button>--%>


<%--</div>--%>
<%--<div class="friend-list">--%>
<%--    <h2>suggested Friend List</h2>--%>
<%--    <ul id="friendList"></ul>--%>
<%--</div>--%>
<%--<div class="friend-list">--%>
<%--    <h2>Your Friends</h2>--%>
<%--    <ul id="userFriendsList"></ul>--%>
<%--</div>--%>


<script>
    getData();

    function getData() {
        var username = sessionStorage.getItem("username");
        var password = sessionStorage.getItem("password");

        var credentialData = {
            username: username,
            password: password
        };

        $.ajax({
            type: "POST",
            url: "/SocialMN/user/details",
            contentType: "application/json",
            data: JSON.stringify(credentialData),
            success: function (response) {
                // alert("fetching data successfully");
                $("#usernameSpan").text(response.data.username);
                $("#fullNameSpan").text(response.data.fullname);
                $("#dobSpan").text(response.data.dateOfBirth);
                $("#bioSpan").text(response.data.bio);
                $("#emailSpan").text(response.data.email);


            },
            error: function (error) {
                console.error("Error fetching data", error);
                alert("Error fetching data" + error);
            }
        });
    }

    function logout() {
        $.ajax({
            type: "POST",
            url: "/SocialMN/user/logout",
            success: function () {
                // alert("Logout successful");
                window.location.href = "/SocialMN/user/index";
            },
            error: function (error) {
                console.error("Error during logout", error);
                alert("Error during logout" + error);
            }
        });
    }


    function getSuggestedFriends() {

        var loggedUserName = sessionStorage.getItem("username");
        $.ajax({
            type: "GET",
            url: "/SocialMN/user/suggested-friends",
            headers: {
                'user-name': loggedUserName
            },
            // contentType:'application/json',
            success: function (response) {
                // alert("Fetching suggested friends successfully");
                displayFriends(response);
            },
            error: function (error) {
                alert("Error fetching suggested friends" + error);
            }
        });
    }

    function displayFriends(friends) {
        var friendList = $("#friendList");

        friends.forEach(function (friend) {
            var listItem = $("<li>").addClass("list-item");
            listItem.text(friend.username);

            var addButton = $("<button>").addClass("add-button");
            addButton.text("Add Friend");
            addButton.click(function () {
                addFriend(friend.username);

            });

            listItem.append(addButton);
            friendList.append(listItem);
        });
    }

    getSuggestedFriends();

    function addFriend(friendUsername) {
        var loggedUserName = sessionStorage.getItem("username");


        $.ajax({
            type: "POST",
            url: "/SocialMN/user/add-friend",
            contentType: "application/json",
            headers: {
                'userName': loggedUserName,
                'friendUserName': friendUsername
            },
            success: function () {
                showNotification("Friend added successfully");

                // alert("Friend added successfully");
                setTimeout(function () {
                    removeFriendFromUI(friendUsername);
                }, 500);
            },

            error: function (error) {
                alert("Error adding friend" + error);
            }
        });
    }

    function removeFriendFromUI(friendUsername) {
        // Remove the friend from the UI
        $("li:contains('" + friendUsername + "')").fadeOut('slow', function () {
            $(this).remove();
        });
    }

    function showNotification(message, type = 'info') {
        if (Notification.permission === 'granted') {
            var options = {
                body: message,
                // icon: '/path/to/icon.png',
            };
            var notification = new Notification('User Dashboard', options);
        } else if (Notification.permission !== 'denied') {
            Notification.requestPermission().then(function (permission) {
                if (permission === 'granted') {
                    showNotification(message, type);
                }
            });
        }
    }

    function loadUserFriends() {
        var loggedUserName = sessionStorage.getItem("username");

        $.ajax({
            type: "GET",
            url: "/SocialMN/user/user-friends",
            headers: {
                'user-name': loggedUserName
            },
            success: function (response) {
                displayUserFriends(response);
            },
            error: function (error) {
                alert("Error fetching user friends: " + error);
            }
        });
    }

    function displayUserFriends(userFriends) {
        var userFriendsList = $("#userFriendsList");
        userFriendsList.empty(); // Clear the existing list

        userFriends.forEach(function (friend) {
            var listItem = $("<li>").addClass("list-item");
            listItem.text(friend.username);
            userFriendsList.append(listItem);
        });
    }
</script>
</body>
</html>
