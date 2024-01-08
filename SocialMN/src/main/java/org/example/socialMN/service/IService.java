package org.example.socialMN.service;

import org.example.socialMN.dto.FriendOfFriendsDTO;
import org.example.socialMN.dto.UserDTO;
import org.example.socialMN.model.User;

import java.util.List;

public interface IService {

    void addUser(User user);

    boolean getValidateUser(String username, String password);

    User getUserData(String username, String password);

    List<User> getSuggestedFriends(String loggedUserName);

    void addFriend(User user, User friend);

    User getByUsername(String username);

    List<User> getUserFriends(String loggedUserName);

    void removeFriend(String loggedUserName, String friendUserName);

    boolean isFriends(User user, User friend);


    List<User> findFriendsOfFriend(User loggedInUsername, User friendUsername);
}
