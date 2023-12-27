package org.example.socialMN.handler;

import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

@Component
public class LoginHandler {


    @Autowired
    private IService iService;

    public ResponseEntity<String> handleRegistrationRequest(User user) {
        System.out.printf("Registered Data: " + user);
        iService.addUser(user);
        return ResponseEntity.ok("Registered Successfully");
    }

    public ResponseEntity<String> validateUser(String username, String password) {
        if (iService.getValidateUser(username, password)) {
            return ResponseEntity.ok("Login Successfully");
        } else {
            return ResponseEntity.badRequest().body("Login Failed");
        }
    }
}
