package org.example.socialMN.controller;

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


    @Autowired
    private LoginHandler loginHandler;


    @PostMapping("/logout")
    public ResponseEntity<String> logout() {
        return ResponseEntity.ok("Logout successful");
    }

    @PostMapping(value = "/signup", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> getRegisteredData(@RequestBody User user) {
        return loginHandler.handleRegistrationRequest(user);
    }

    @PostMapping("/login")
    public ResponseEntity<String> loginUser(@RequestBody Login login) {
        String username = login.getUsername();
        String password = login.getPassword();
        return loginHandler.validateUser(username, password);
    }

}
