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