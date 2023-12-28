<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: left;
            height: 100vh;
        }

        .dashboard-container {
            width: 400px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .profile-point {
            font-size: 24px;
            margin-bottom: 10px;
        }

        h1 {
            margin-bottom: 20px;
        }

        p {
            margin-bottom: 10px;
        }

        span {
            font-weight: bold;
        }

        img {
            max-width: 100%;
            border-radius: 8px;
        }

        h1 {

            margin-bottom: 20px;

        }

        .list-item {
            margin-bottom: 10px;
            font-weight: bold;
        }

        .add-button {
            background-color: #4CAF50;
            color: white;
            margin-left: 10px;
        }


    </style>
</head>
<body>
<h1>User Dashboard</h1>


<div class="dashboard-container">
    <div class="profile-point">&#8226;</div>

    <p>Username: <span id="usernameSpan"></span></p>
    <p>Full Name: <span id="fullNameSpan"></span></p>
    <p>Date of Birth: <span id="dobSpan"></span></p>
    <p>Profile Picture:</p>
    <img id="profilePicture" src="" alt="Profile Picture">

    <p>Bio: <span id="bioSpan"></span></p>
    <p>Email: <span id="emailSpan"></span></p>
    <button id="logoutButton" onclick="logout()">Logout</button>

</div>
<div class="friend-list">
    <h2>suggested Friend List</h2>
    <ul id="friendList"></ul>
</div>


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
                alert("Friend added successfully");
            },
            error: function (error) {
                alert("Error adding friend" + error);
            }
        });
    }


</script>
</body>
</html>
