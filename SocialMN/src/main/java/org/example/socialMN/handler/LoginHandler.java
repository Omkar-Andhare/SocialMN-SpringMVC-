package org.example.socialMN.handler;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.exceptions.LoginValidationException;
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

    static void validatePassword(String password) throws SignupValidationException {
        if (password.length() < 8) {
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
        if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$")) {
            throw new SignupValidationException("Invalid email format");
        }

    }

    public ResponseEntity<String> handleRegistrationRequest(User user) throws SignupValidationException {

        logger.info("validating the username , password, email");
        /**
         * Validates the username format to ensure it contains only letters, numbers, and underscores.
         * Throws a LoginValidationException if the username contains invalid characters.
         */
        if (!user.getUsername().matches("[a-zA-Z0-9_]+")) {
            throw new SignupValidationException("Username can only contain letters, numbers, and underscores");
        }
        validatePassword(user.getPassword());
        validateEmail(user.getEmail());


        logger.info("Received registration request for user:" + user.getUsername());
        iService.addUser(user);
        logger.info("User registered successfully - Username: " + user.getUsername());
        return ResponseEntity.ok("Registered Successfully");
    }

    public ResponseEntity<String> validateUser(String username, String password)  {


        logger.info("Received login request - Username: " + username);

        if (iService.getValidateUser(username, password)) {
            logger.info("Login successful - Username: " + username);
            return ResponseEntity.ok("Login Successfully");
        } else {
            logger.warn("Login failed for user: " + username);
            return ResponseEntity.badRequest().body("Login Failed");
        }
    }
}
