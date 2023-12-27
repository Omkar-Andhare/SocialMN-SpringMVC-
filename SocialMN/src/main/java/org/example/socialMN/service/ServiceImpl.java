package org.example.socialMN.service;

import org.example.socialMN.dao.IDao;
import org.example.socialMN.model.Friendship;
import org.example.socialMN.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service

public class ServiceImpl implements IService {

    @Autowired
    private IDao dao;

    @Override
    public void addUser(User user) {
        dao.addUser(user);
    }

    @Override
    public boolean getValidateUser(String username, String password) {
        return dao.getValidateUser(username, password);
    }


    @Override
    public User getUserData(String username, String password) {
        return dao.getUserData(username, password);
    }

    @Override
    public List<User> getSuggestedFriends(String loggedUserName) {
        String hql = "FROM "+User.class.getName() +" where username != :userName";

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("userName", loggedUserName);

        return dao.executeHqlQuery(hql, User.class, parameters);
    }

    @Override
    public void addFriend(User user, User friend) {

        Friendship friends = new Friendship();
        friends.setUser(user);
        friends.setFriend(friend);
        dao.save(friends);

    }


    @Override
    public User getByUsername(String username) {
        return dao.getByUsername(username);
    }
}
