package org.example.socialMN.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.exceptions.LoginValidationException;
import org.example.socialMN.exceptions.SignupValidationException;
import org.example.socialMN.handler.LoginHandler;
import org.example.socialMN.model.Login;
import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class LoginController {
    private static final Logger logger = LogManager.getLogger(IService.class);


    @Autowired
    private LoginHandler loginHandler;

    /**
     * Handles logout requests.
     *
     * @return ResponseEntity with a success message if logout is successful.
     */
    @PostMapping("/logout")
    public ResponseEntity<String> logout() {
        logger.info("Received logout request");

        return ResponseEntity.ok("Logout successful");
    }

    /**
     * Handles user registration requests.
     * The User object containing registration details.
     */
    @PostMapping(value = "/signup", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> getRegisteredData(@RequestBody User user) throws SignupValidationException {

        if (null == user.getUsername() && null == user.getEmail() && null == user.getPassword()) {
            throw new SignupValidationException("Username , email, password cannot be Null");
        }
        logger.info("Received registration request for user: " + user.getUsername());
        return loginHandler.handleRegistrationRequest(user);
    }

    /**
     * Handles user login requests.
     * login The Login object containing user login credentials.
     * validate the user
     */
    @PostMapping("/login")
    public ResponseEntity<String> loginUser(@RequestBody Login login) throws LoginValidationException {
        String username = login.getUsername();
        String password = login.getPassword();
        logger.info("Received login request - Username: " + username);
        return loginHandler.validateUser(username, password);
    }
}
