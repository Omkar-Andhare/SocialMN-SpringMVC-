package org.example.socialMN.controller;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.dto.FriendDTO;
import org.example.socialMN.dto.UserDTO;
import org.example.socialMN.exceptions.*;
import org.example.socialMN.handler.UserHandler;
import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
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

    private static final Logger logger = LogManager.getLogger(IService.class);

    @Autowired
    private UserHandler userHandler;


    /**
     * Handles a POST request to retrieve user data based on provided credentials.
     * userCredentials The user credentials sent in the request body.
     */
    @PostMapping(value = "/details", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getUserData(@RequestBody User userCredentials) throws UserDataRetrievalException {
        try {
            return userHandler.handleUserDataRequest(userCredentials);
        } catch (UserDataRetrievalException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            // Handle other exceptions
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Internal Server Error");
        }
    }

    /**
     * Handles a GET request to retrieve suggested friends for a user.
     * loggedUserName The username of the logged-in user (provided in the request header).
     * return ResponseEntity containing a list of suggested friends for the logged-in user.
     */
    @GetMapping(value = "/suggested-friends", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<FriendDTO>> getFriendsSuggestions(@RequestHeader(value = "user-name") String loggedUserName) {
        try {
            // Validate if the username is passed or not
            if (loggedUserName == null || loggedUserName.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
            }
            List<FriendDTO> userList = userHandler.handleSuggestedFriends(loggedUserName);
            return new ResponseEntity<>(userList, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Handles a POST request to add a friend for the specified user.
     * userName        The username of the user initiating the friend request (provided in the request header).
     * friendUserName  The username of the friend to be added (provided in the request header).
     * return ResponseEntity containing the result that added or not
     */

    @PostMapping(value = "/add-friend", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> addFriends(@RequestHeader String userName, @RequestHeader String friendUserName) {
        logger.info("Received add friend request - User: " + userName + ", Friend:" + friendUserName);

        try {
            userHandler.handleAddFriendRequest(userName, friendUserName);
            return ResponseEntity.ok("Added Successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @GetMapping(value = "/user-friends", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<UserDTO>> getUserFriends(@RequestHeader(value = "user-name") String loggedUserName) throws UserFriendsException {
        List<UserDTO> userFriends = userHandler.handleGetUserFriends(loggedUserName);
        return new ResponseEntity<>(userFriends, HttpStatus.OK);
    }

    /**
     * Handles a DELETE request to remove a friend for the specified user.
     * userName        The username of the user initiating the friend removal (provided in the request header).
     * friendUserName  The username of the friend to be removed (provided in the request header).
     * return ResponseEntity containing the result that friend removed or not.
     */
    @DeleteMapping("/remove-friend")
    public ResponseEntity<String> removeFriend(@RequestHeader String loggedUserName, @RequestHeader String friendUserName) throws RemoveFriendException {
        try {
            logger.info("Received remove friend request - User: " + loggedUserName + ", Friend: " + friendUserName);
            userHandler.handleRemoveFriend(loggedUserName, friendUserName);
            return ResponseEntity.ok("Friend removed successfully");
        } catch (RemoveFriendException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            // Handle other exceptions
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Internal Server Error");
        }
    }

    @GetMapping("/mutual-friends")
    public ResponseEntity<List<String>> getMutualFriends(@RequestHeader String loggedUserName, @RequestHeader String friendUserName) throws MutualFriendsException {
        logger.info("Received request for mutual friends - User: " + loggedUserName + ", Friend: " + friendUserName);
        List<String> mutualFriends = userHandler.getMutualFriends(loggedUserName, friendUserName);
        return ResponseEntity.ok(mutualFriends);
    }

    @GetMapping("/are-friends")
    public ResponseEntity<Boolean> areFriends(@RequestParam("user1") String loggedUserName, @RequestParam("user2") String username) {
        try {
            boolean areFriends = userHandler.areFriends(loggedUserName, username);
            return ResponseEntity.ok(areFriends);
        } catch (AreFriendsException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(false);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(false);
        }
    }
}



