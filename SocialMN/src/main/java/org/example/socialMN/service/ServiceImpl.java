package org.example.socialMN.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.example.socialMN.dao.IDao;
import org.example.socialMN.model.Friendship;
import org.example.socialMN.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ServiceImpl implements IService {
    private static final Logger logger = LogManager.getLogger(IService.class);


    @Autowired
    private IDao dao;

    @Override
    public void addUser(User user) {
        logger.info("Adding a new user: " + user.getUsername());
        dao.save(user);
        logger.info("User added successfully: " + user.getUsername());
    }

    /**
     * Validates a user in the system based on the provided username and password.
     * This method checks if a user with the given username and password combination exists.
     * return true if a user with the specified username and password exists, false otherwise.
     */
    @Override
    public boolean getValidateUser(String username, String password) {
        logger.info("Validating user with username: " + username);


        // Define the HQL (Hibernate Query Language) to count users with the given username and password
        String hql = "SELECT COUNT(*) FROM User WHERE username = :username AND password = :password";
        Map<String, Object> parameters = new HashMap<>();

        // Prepare parameters to be used in the HQL query
        parameters.put("username", username);
        parameters.put("password", password);

        logger.info("User validation result for " + username + ": " + dao.executeQueryForValidation(hql, parameters));

        // Delegate the validation to the DAO layer by executing the HQL query for validation
        return dao.executeQueryForValidation(hql, parameters);


    }

    /**
     * Retrieves user data based on the provided username and password.
     * This method retrieves a user entity from the system using the specified username and password.
     *
     * @return The User entity corresponding to the given username and password
     */
    @Override
    public User getUserData(String username, String password) {
        logger.info("Retrieving user data for username: " + username + "ANd password");


        // Define the HQL (Hibernate Query Language) to select a user by username and password
        String hql = "FROM " + User.class.getName() + " WHERE username = :username AND password = :password";
        // Prepare parameters to be used in the HQL query
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("username", username);
        parameters.put("password", password);

        logger.info("User data retrieved successfully for " + username);


        // Delegate the query execution to the DAO layer, expecting a single result
        return dao.executeHqlQuerySingleResult(hql, User.class, parameters);
    }

    /**
     * Retrieves a list of suggested friends for the user with the given username.
     * This method queries the system to obtain a list of users who are suggested friends
     * for the user with the specified username, excluding the user themselves.
     *
     * @return A list of User entities representing suggested friends for the logged-in user.
     */
    @Override
    public List<User> getSuggestedFriends(String loggedUserName) {

        logger.info("Retrieving suggested friends for user: " + loggedUserName);


        // Define the HQL (Hibernate Query Language) to select suggested friends for the logged-in user
        String hql = "FROM " + User.class.getName() + " where username != :userName";

        // Prepare parameters to be used in the HQL query
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("userName", loggedUserName);

        logger.info("Suggested friends retrieved successfully for " + loggedUserName);


        // Delegate the query execution to the DAO layer
        return dao.executeHqlQuery(hql, User.class, parameters);
    }

    /**
     * Adds a friendship connection between the given user and friend.
     * the user and the specified friend, and then saves this relationship using the DAO layer.
     */
    @Override
    public void addFriend(User user, User friend) {
        logger.info("Adding friend connection between " + user.getUsername() + " and " + friend.getUsername());

        // Create a new Friendship entity to represent the connection
        Friendship friends = new Friendship();
        friends.setUser(user);
        friends.setFriend(friend);
        dao.save(friends);
        logger.info("Friend connection added successfully");
    }

    /**
     * Retrieves a user by their username using Hibernate Query Language (HQL).
     * return The User object corresponding to the provided username
     */
    @Override
    public User getByUsername(String username) {

        logger.info("Retrieving user by username: " + username);

        // HQL query to select a user based on the provided username
        String hql = "FROM User WHERE username = :username";

        // Set the parameters for the HQL query
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("username", username);

        logger.info("User retrieved successfully for " + username);

        // Execute the HQL query and retrieve a single result (or null)
        return dao.executeHqlQuerySingleResult(hql, User.class, parameters);
    }


}
