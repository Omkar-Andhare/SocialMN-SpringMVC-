getData();

function getData() {
    var username = sessionStorage.getItem("username");
    var password = sessionStorage.getItem("password");

    var credentialData = {
        username: username, password: password
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
        type: "POST", url: "/SocialMN/user/logout", success: function () {
            // alert("Logout successful");
            window.location.href = "/SocialMN/user/index";
        }, error: function (error) {
            console.error("Error during logout", error);
            alert("Error during logout" + error);
        }
    });
}


$(document).ready(function getSuggestedFriendsList() {
    // console.log("Before AJAX call");


    var loggedUserName = sessionStorage.getItem("username");
    $.ajax({
        type: "GET", url: "/SocialMN/user/suggested-friends", headers: {
            'user-name': loggedUserName
        }, // contentType:'application/json',
        success: function (response) {
            // alert("Fetching suggested friends successfully");
            displayFriends(response);
        }, error: function (error) {
            alert("Error fetching suggested friends" + error);
        }
    });
    // console.log("After AJAX call");

});


function displayFriends(friends) {
    var friendList = $("#friendList");
    friendList.empty(); // Clear the existing list


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


function addFriend(friendUsername) {
    var loggedUserName = sessionStorage.getItem("username");


    $.ajax({
        type: "POST", url: "/SocialMN/user/add-friend", contentType: "application/json", headers: {
            'userName': loggedUserName, 'friendUserName': friendUsername
        }, success: function () {
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
            body: message, // icon: '/path/to/icon.png',
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

var userFriendsListVisible = false;

function loadUserFriends() {
    var loggedUserName = sessionStorage.getItem("username");

    $.ajax({
        type: "GET", url: "/SocialMN/user/user-friends",
        headers: {
            'user-name': loggedUserName
        }, success: function (response) {
            displayUserFriends(response);
        }, error: function (error) {
            alert("Error fetching user friends: " + error);
        }
    });
    var userFriendsList = $("#userFriendsList");
    if (userFriendsListVisible) {
        userFriendsList.hide();
        userFriendsListVisible = false;
    } else {
        userFriendsList.show();
        userFriendsListVisible = true;
    }
}


function displayUserFriends(userFriends) {

    var username = sessionStorage.getItem("username");

    var userFriendsList = $("#userFriendsList");
    userFriendsList.empty(); // Clear the existing list

    userFriends.forEach(function (friend) {
        var listItem = $("<li>").addClass("list-item");
        listItem.text(friend.username);

        var removeButton = $("<button>").addClass("remove-button").text("Remove");
        removeButton.click(function () {
            removeFriend(friend.username);
        });

        var mutualButton = $("<button>").addClass("mutual-button").text("Mutual Friends");
        mutualButton.click(function () {
            getMutualFriends(friend.username);
        });

        var friendsButton = $("<button>").addClass("view-friendsButton").text("Friends");
        friendsButton.click(function () {
            viewFriends(friend.username);
        });

        var viewProfileButton = $("<button>").addClass("view-profile-button").text("View Profile");
        viewProfileButton.click(function () {
            viewProfile(friend.username);
        });


        listItem.append(removeButton);
        listItem.append(mutualButton);
        listItem.append(friendsButton);
        listItem.append(viewProfileButton);


        $("#userFriendsList").append(listItem);
    });
}

function removeFriend(friendUsername) {
    var loggedUserName = sessionStorage.getItem("username");

    $.ajax({
        type: "DELETE", url: "/SocialMN/user/remove-friend", contentType: "application/json", headers: {
            'loggedUserName': loggedUserName, 'friendUserName': friendUsername
        }, success: function () {
            showNotification("Friend removed successfully");
            setTimeout(function () {
                removeFriendFromUI(friendUsername);
            }, 500);
        }, error: function (error) {
            alert("Error removing friend: " + error);
        }
    });
}


function getMutualFriends(friendUsername) {
    var loggedUserName = sessionStorage.getItem("username");

    $.ajax({
        type: "GET", url: "/SocialMN/user/mutual-friends", headers: {
            'loggedUserName': loggedUserName, 'friendUserName': friendUsername
        }, success: function (response) {
            displayMutualFriends(response);
        }, error: function (error) {
            alert("Error fetching mutual friends: " + error);
        }
    });
}

function displayMutualFriends(mutualFriends) {
    // if (mutualFriends.length > 0) {
    //     var message = "Mutual Friends:\n" + mutualFriends.join("\n");
    //     alert(message);
    // } else {
    //     alert("No mutual friends found.");
    // }
    var mutualFriendsContent = document.getElementById('mutualFriendsContent');

    if (mutualFriends.length > 0) {
        var usernames = mutualFriends.map(function (friend) {
            return `<li>${friend}</li>`;
        });

        var mutualFriendsHTML = `<div><h1>Mutual Friends</h1><ul>${usernames.join('')}</ul></div>`;
        mutualFriendsContent.innerHTML = mutualFriendsHTML;
    } else {
        mutualFriendsContent.innerHTML = "<p>No mutual friends found.</p>";
    }
    openPopup('mutualFriendsPopup');
}

function viewFriends(username) {

    $.ajax({
        type: "GET",
        url: "/SocialMN/user/user-friends",
        headers: {
            'user-name': username
        },
        success: function (response) {
            view(response);
        },
        error: function (error) {
            alert("Error fetching user friends: " + error);
        }
    });
}


function view(response) {
    // if (response.length > 0) {
    //     var usernames = "";
    //     // Iterate over each friend in the response
    //     for (var i = 0; i < response.length; i++) {
    //         // Extract the username of the friend
    //         var friendUsername = response[i].username;
    //         usernames += friendUsername + "\n";
    //     }
    //     var message = "Friends:\n" + usernames;
    //     alert(message);
    // } else {
    //     alert("Only You");
    // }

    var friendListContent = document.getElementById('friendListContent');

    if (response.length > 0) {
        var usernames = "";
        for (var i = 0; i < response.length; i++) {
            var friendUsername = response[i].username;
            usernames += `<li>${friendUsername}</li>`;
        }

        var friendListHTML = `<h1>Friends</h1><ul>${usernames}</ul>`;
        friendListContent.innerHTML = friendListHTML;

    } else {
        friendListContent.innerHTML = "<h1>Profile</h1>\n<p>No friends available.</p>";
    }

    openPopup('friendListPopup');

}

function openPopup(popupId) {
    var popup = document.getElementById(popupId);
    popup.style.display = "block";
}

// Function to close a popup
function closePopup(popupId) {
    var popup = document.getElementById(popupId);
    popup.style.display = "none";
}

// Function to display user profile details in a popup
function displayProfile(response) {
    var profileContent = document.getElementById('profileContent');
    profileContent.innerHTML = `
                <h1>Profile</h1>
                <p>Username: <span>${response.username}</span></p>
                <p>Full Name: <span>${response.fullname}</span></p>
                <p>Date of Birth: <span>${response.dateOfBirth}</span></p>
                <p>Bio: <span>${response.bio}</span></p>
                <p>Email: <span>${response.email}</span></p>
            `;

    openPopup('profilePopup');
}


function viewProfile(username) {

    $.ajax({
        type: "GET",
        url: "/SocialMN/user/view-profile",
        contentType: "application/json",
        headers: {
            'user-name': username
        },
        success: function (response) {
            // alert("fetching data successfully");
            displayProfile(response);

            // var message = "Username: " + response.username +
            //     "\nFull Name: " + response.fullname +
            //     "\nDate of Birth: " + response.dateOfBirth +
            //     "\nBio: " + response.bio +
            //     "\nEmail: " + response.email;
            // alert(message);
        },
        error: function (error) {
            alert("Error fetching user profile: " + error);
        }
    });
}


