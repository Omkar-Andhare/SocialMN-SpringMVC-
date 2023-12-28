package org.example.socialMN.handler;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
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

    public ResponseEntity<String> handleRegistrationRequest(User user) {
        logger.info("Received registration request for user:" + user.getUsername());
        iService.addUser(user);
        logger.info("User registered successfully - Username: " + user.getUsername());
        return ResponseEntity.ok("Registered Successfully");
    }

    public ResponseEntity<String> validateUser(String username, String password) {
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
