package org.example.socialMN.service;

import org.example.socialMN.model.User;

import java.util.List;

public interface IService {

     void addUser(User user);
      boolean getValidateUser(String username, String password);

     User getUserData(String username, String password);

     List<User> getSuggestedFriends(String loggedUserName);

    void addFriend(User user, User friend);

    User getByUsername(String username);






}
