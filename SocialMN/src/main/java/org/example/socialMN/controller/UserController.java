package org.example.socialMN.controller;


import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;
import org.example.socialMN.dto.UserDTO;
import org.example.socialMN.handler.UserHandler;
import org.example.socialMN.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserHandler userHandler;


    @PostMapping(value = "/details", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getUserData(@RequestBody User userCredentials) {
        return userHandler.handleUserDataRequest(userCredentials);
    }

    @GetMapping(value = "/suggested-friends", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<UserDTO>> getFriendsSuggestions(
            @RequestHeader(value = "user-name") String loggedUserName
    ) {
        //TODO validate if user name is passed or not
        List<UserDTO> userList = userHandler.handleGetAllUsersRequest(loggedUserName);

        LOGGER.debug("#################################################### USER LIST >> " + userList);
        return new ResponseEntity<>(userList, HttpStatus.OK);
    }

//    @GetMapping(value = "/suggested-friends", produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<List<UserDTO>> getFriendsSuggestions(
//
//    ) {
//        //TODO validate if user name is passed or not
//        List<UserDTO> userList = userHandler.handleGetAllUsersRequest();
//
//        LOGGER.debug("#################################################### USER LIST >> " + userList);
//        return new ResponseEntity<>(userList, HttpStatus.OK);
//    }

    @PostMapping(value = "/add-friend", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> addFriends(@RequestHeader String userName,
                                             @RequestHeader String friendUserName) {
        return userHandler.handleAddFriendRequest(userName, friendUserName);
    }
}
