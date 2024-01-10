package org.example.socialMN.handler;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.dto.FriendDTO;
import org.example.socialMN.dto.UserDTO;
import org.example.socialMN.exceptions.*;
import org.example.socialMN.model.Friendship;
import org.example.socialMN.model.User;
import org.example.socialMN.service.IService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Component
public class UserHandler {
    private static final Logger logger = LogManager.getLogger(IService.class);

    @Autowired
    private IService iService;


    public ResponseEntity<?> handleUserDataRequest(User userCredentials) throws UserDataRetrievalException {
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
        BeanUtils.copyProperties(user, userDTO);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDateOfBirth = dateFormat.format(user.getDateOfBirth());
        userDTO.setDateOfBirth(formattedDateOfBirth);
        logger.debug("Mapped user data to DTO successfully");
        return userDTO;
    }

    public FriendDTO mapToFriendDTO(User user) {
        FriendDTO friendDTO = new FriendDTO();
        BeanUtils.copyProperties(user, friendDTO);
        return friendDTO;
    }

    public List<FriendDTO> handleSuggestedFriends(String loggedUserName) throws SuggestedFriendsException {
        logger.info("Received request to get suggested friends for user: " + loggedUserName);
        List<User> allUsers = iService.getSuggestedFriends(loggedUserName);
        List<FriendDTO> list = new ArrayList<>();
        for (User user : allUsers) {
            FriendDTO friendDTO = mapToFriendDTO(user);
            list.add(friendDTO);
        }
        return list;
    }

    public List<UserDTO> handleGetUserFriends(String loggedUserName) throws UserFriendsException {
        List<User> userFriends = iService.getUserFriends(loggedUserName);
        List<UserDTO> list = new ArrayList<>();
        for (User user : userFriends) {
            UserDTO userDTO = mapUserToDTO(user);
            list.add(userDTO);
        }
        return list;
    }

    public void handleRemoveFriend(String loggedUserName, String friendUserName) throws RemoveFriendException {
        iService.removeFriend(loggedUserName, friendUserName);
    }

    public ResponseEntity<String> handleAddFriendRequest(String userName, String friendUserName) throws AddFriendException {
        logger.info("Received request to add friend - User: {}, Friend: {}" + userName + "," + friendUserName);

        User user = iService.getByUsername(userName);
        User friend = iService.getByUsername(friendUserName);
        if (user != null && friend != null) {
            iService.addFriend(user, friend);
            iService.addFriend(friend, user);
            return ResponseEntity.ok("Added Successfully");
        } else {
            throw new AddFriendException("User or friend not found");
        }

    }

    public List<String> getMutualFriends(String loggedUserName, String friendUserName) throws MutualFriendsException {
        try {
            List<String> loggedUserFriends = getUserFriends(loggedUserName);

        List<String> friendFriends = getUserFriends(friendUserName);
        loggedUserFriends.retainAll(friendFriends);
        return loggedUserFriends;
    }catch (Exception e){
            throw new MutualFriendsException("Error retrieving mutual friends: " + e.getMessage());

        }
    }

    public List<String> getUserFriends(String username) {
        User user = iService.getByUsername(username);
        if (user != null) {
            List<Friendship> friendships = user.getFriendList();
            return friendships.stream().map(friendship -> friendship.getFriend().getUsername()).collect(Collectors.toList());
        }
        return Collections.emptyList();
    }

    public boolean areFriends(String loggedUserName, String username) throws AreFriendsException {
        User user1 = iService.getByUsername(loggedUserName);
        User user2 = iService.getByUsername(username);
        if (user1 != null && user2 != null) {
            return iService.isFriends(user1, user2);
        }
        return false;
    }
}