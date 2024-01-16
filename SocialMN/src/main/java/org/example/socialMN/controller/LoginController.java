package org.example.socialMN.controller;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.exceptions.SignupValidationException;
import org.example.socialMN.handler.LoginHandler;
import org.example.socialMN.model.Login;
import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Base64;

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
        try {
            if (null == user.getUsername() && null == user.getEmail() && null == user.getPassword()) {
                throw new SignupValidationException("Username , email, password cannot be Null");
            }
            logger.info("Received registration request for user: " + user.getUsername());

            /*if (user.getProfilePicture() != null) {
                // Get the bytes of the uploaded image
                byte[] imageBytes = user.getProfilePicture().getBytes();

                // Encode the image bytes to base64
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                // Now you can use the base64Image string as needed in your application logic
                // For example, you might want to save it to a database
                user.setProfilePicture(base64Image);
            } else {
                throw new SignupValidationException("img acceptance error");
            }*/

            return loginHandler.handleRegistrationRequest(user);
        } catch (Exception e) {
            return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    @GetMapping("/check-username")
    public ResponseEntity<Boolean> checkUsernameExistence(@RequestHeader String username) {
        boolean exists = loginHandler.usernameExists(username);
        return ResponseEntity.ok(exists);
    }

    @GetMapping("/check-email")
    public ResponseEntity<Boolean> checkEmailExistence(@RequestHeader String email) {
        boolean exists = loginHandler.useremailExists(email);
        return ResponseEntity.ok(exists);
    }

    /**
     * Handles user login requests.
     * login The Login object containing user login credentials.
     * validate the user
     */
    @PostMapping("/login")
    public ResponseEntity<String> loginUser(@RequestBody Login login) {
        String username = login.getUsername();
        String password = login.getPassword();
        logger.info("Received login request - Username: " + username);
        return loginHandler.validateUser(username, password);
    }
}
