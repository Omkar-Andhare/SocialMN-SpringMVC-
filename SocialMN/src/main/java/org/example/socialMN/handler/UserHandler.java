package org.example.socialMN.handler;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.dto.UserDTO;
import org.example.socialMN.model.Friendship;
import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class UserHandler {


    private static final Logger logger = LogManager.getLogger(IService.class);


    @Autowired
    private IService iService;

    public ResponseEntity<?> handleUserDataRequest(User userCredentials) {


        Map<String, Object> result = new HashMap<>();
        String username = userCredentials.getUsername();
        String password = userCredentials.getPassword();
        logger.info("Received request for user credentials - ," + username + "," + password);
        User user = iService.getUserData(username, password);
        UserDTO userDTO = mapUserToDTO(user);
        result.put("data", userDTO);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    private UserDTO mapUserToDTO(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setUsername(user.getUsername());
        userDTO.setFullname(user.getFullname());

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDateOfBirth = dateFormat.format(user.getDateOfBirth());
        userDTO.setDateOfBirth(formattedDateOfBirth);

        userDTO.setGender(user.getGender());
        userDTO.setProfilePicture(user.getProfilePicture());
        userDTO.setBio(user.getBio());
        userDTO.setEmail(user.getEmail());

        if (null != user.getFriendList() && !user.getFriendList().isEmpty()) {
            userDTO.setFriends(user.getFriendList().stream().map(Friendship::getFriend).collect(Collectors.toSet()));
        }
        logger.debug("Mapped user data to DTO successfully");

        return userDTO;
    }


    public List<UserDTO> handleGetAllUsersRequest(String loggedUserName) {
        logger.info("Received request to get suggested friends for user: " + loggedUserName);

        List<User> allUsers = iService.getSuggestedFriends(loggedUserName);
        return allUsers.stream().map(user -> mapUserToDTO(user)).collect(Collectors.toList());
    }

    public List<UserDTO> handleGetUserFriends(String loggedUserName) {
        List<User> userFriends = iService.getUserFriends(loggedUserName);
        return userFriends.stream().map(user -> mapUserToDTO(user)).collect(Collectors.toList());

    }


    public ResponseEntity<String> handleAddFriendRequest(String userName, String friendUserName) {
        logger.info("Received request to add friend - User: {}, Friend: {}" + userName + "," + friendUserName);

        User user = iService.getByUsername(userName);
        User friend = iService.getByUsername(friendUserName);

        /*
        incomplete first find out the friends of user
         */


        if (areFriends(user, friend)) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Users are already friends");
        }


        if (user != null && friend != null) {
            iService.addFriend(user, friend);
            return ResponseEntity.ok("Added Successfully");
        }

        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User or friend not found");
    }


    private boolean areFriends(User user, User friend) {
          /*
        incomplete first find out the friends of user
         */
        List<Friendship> friendships = user.getFriendList();
        if (friendships != null) {
            for (Friendship friendship : friendships) {
                if (friendship.getFriend().equals(friend)) {
                    return true; // Friendship already exists
                }
            }
        }
        return false; // They are not friends
    }

}