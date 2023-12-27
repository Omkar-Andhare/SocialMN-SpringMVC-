package org.example.socialMN.service;

import org.example.socialMN.model.User;

import java.util.List;

public interface IService {

    public void addUser(User user);
    public  boolean getValidateUser(String username, String password);

    public User getUserData(String username, String password);

    public List<User> getSuggestedFriends(String loggedUserName);

    void addFriend(User user, User friend);

    User getByUsername(String username);






}
