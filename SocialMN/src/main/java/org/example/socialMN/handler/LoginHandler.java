package org.example.socialMN.handler;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.exceptions.AuthenticationException;
import org.example.socialMN.exceptions.SignupValidationException;
import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class LoginHandler {

    private static final Logger logger = LogManager.getLogger(IService.class);

    @Autowired
    private IService iService;

    static void validateUsername(String username) throws SignupValidationException {
        if (username == null || username.trim().isEmpty() || "null".equals(username.trim())) {
            throw new SignupValidationException("Username cannot be null");
        }
        if (!username.matches("[a-zA-Z0-9_]+")) {
            throw new SignupValidationException("Username can only contain letters, numbers, and underscores");
        }


    }

    static void validatePassword(String password) throws SignupValidationException {

        if (password == null || password.trim().isEmpty() || "null".equals(password.trim())) {
            throw new SignupValidationException("password cannot be null");
        }
        if (password.length() <= 8) {
            throw new SignupValidationException("Password must be at least 8 characters long");
        }
        // Check for at least one capital letter
        if (!password.matches(".*[A-Z].*")) {
            throw new SignupValidationException("Password must contain at least one capital letter");
        }
        // Check for at least two numbers
        if (!password.matches(".*\\d.*\\d.*")) {
            throw new SignupValidationException("Password must contain at least two numbers");
        }
        // Check for at least one symbol
        if (!password.matches(".*[!@#$%^&*()-_+=].*")) {
            throw new SignupValidationException("Password must contain at least one symbol");
        }
    }

    static void validateEmail(String email) throws SignupValidationException {

        if (email == null || email.trim().isEmpty() || "null".equals(email.trim())) {
            throw new SignupValidationException("Email cannot be null");
        }
        if (!email.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$")) {
            throw new SignupValidationException("Invalid email format");
        }
    }


    public ResponseEntity<String> handleRegistrationRequest(User user) throws SignupValidationException {

        logger.info("validating the username , password, email");


        validateUsername(user.getUsername());

        // Check if the username already exists
        if (usernameExists(user.getUsername())) {
            throw new SignupValidationException("Username is already taken. Please choose another username.");
        }

        validatePassword(user.getPassword());
        validateEmail(user.getEmail());

        // Check if the email already exists
        if (useremailExists(user.getEmail())) {
            throw new SignupValidationException("Email is already taken. Please choose another email.");
        }
//        user.setProfilePicture(user.getProfilePicture());
        iService.addUser(user);

        logger.info("User registered successfully - Username: " + user.getUsername());

        return ResponseEntity.ok("Registered Successfully");
    }

    public ResponseEntity<String> validateUser(String username, String password) {
        logger.info("Received login request - Username: " + username);
        try {
            if (iService.getValidateUser(username, password)) {
                logger.info("Login successful - Username: " + username);
                return ResponseEntity.ok("Login Successfully");
            } else {
                logger.warn("Login failed for user: " + username);
                throw new AuthenticationException("Login Failed");
            }
        } catch (AuthenticationException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    public boolean usernameExists(String username) {
        return iService.existsByUsername(username);
    }

    public boolean useremailExists(String email) {
        return iService.existsByEmail(email);
    }
}
