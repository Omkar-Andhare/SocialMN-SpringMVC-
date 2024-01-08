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

    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(userData.email)) {
        alert("Email should be in a valid format.");
        return;
    }

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
            alert("sign up failed , check password or email format ");
        }
    });
}



