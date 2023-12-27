package org.example.socialMN.dao;


import java.util.List;
import java.util.Map;

public interface IDao {

//    void addUser(User user);

//    boolean getValidateUser(String username, String password);
     boolean executeQueryForValidation(String hql, Map<String, Object> parameters) ;


//    User getUserData(String username, String password);

    //public List<User> getSuggestedFriends();
    <T> void save(T model);

//    User getByUsername(String username);

    <T> List<T> executeHqlQuery(String hql, Class<T> modelClass, Map<String, Object> parameters);

     <T> T executeHqlQuerySingleResult(String hql, Class<T> modelClass, Map<String, Object> parameters);


}
