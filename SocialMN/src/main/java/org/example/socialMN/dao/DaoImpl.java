package org.example.socialMN.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DaoImpl implements IDao {

    @Autowired
    private SessionFactory sessionFactory;

//    @Override
//    public void addUser(User user) {
//
//
//        System.out.printf("IN  IDao layer: " + user);
//        Session session = sessionFactory.openSession();
//        session.beginTransaction();
//        session.saveOrUpdate(user);
//        session.getTransaction().commit();
//    }

    @Override
    public boolean executeQueryForValidation(String hql, Map<String, Object> parameters) {
        Session session = sessionFactory.openSession();
        Query<Long> query = session.createQuery(hql, Long.class);

        if (parameters != null && !parameters.isEmpty()) {
            for (Map.Entry<String, Object> entry : parameters.entrySet()) {
                query.setParameter(entry.getKey(), entry.getValue());
            }
        }

        Long count = query.uniqueResult();
        return count != null && count > 0;
    }

//    @Override
//    public boolean getValidateUser(String username, String password) {
//        Session session = sessionFactory.openSession();
//
//        String hql = "SELECT COUNT(*) FROM User WHERE username = :username AND password = :password";
//        Query<Long> query = session.createQuery(hql, Long.class);
//        query.setParameter("username", username);
//        query.setParameter("password", password);
//
//        Long count = query.uniqueResult();
//        return count != null && count > 0;
//    }

//    @Override
//    public User getUserData(String username, String password) {
//
//        Session session = sessionFactory.openSession();
//        String hql = "FROM User WHERE username = :username AND password = :password";
//        Query<User> query = session.createQuery(hql, User.class);
//        query.setParameter("username", username);
//        query.setParameter("password", password);
//        return query.uniqueResult();
//    }

    /*@Override
    public List<User> getSuggestedFriends() {

        Session session = sessionFactory.openSession();
        String hql = "FROM User";
        Query<User> query = session.createQuery(hql, User.class);
        return query.list();
    }*/

    @Override
    public <T> List<T> executeHqlQuery(String hql, Class<T> modelClass, Map<String, Object> parameters) {

        Session session = sessionFactory.openSession();
        Query<T> query = session.createQuery(hql, modelClass);
        if (null != parameters && !parameters.isEmpty()) {
            parameters.forEach(query::setParameter);
        }
        return query.list();
    }

    @Override
    public <T> T executeHqlQuerySingleResult(String hql, Class<T> modelClass, Map<String, Object> parameters) {
        Session session = sessionFactory.openSession();
        Query<T> query = session.createQuery(hql, modelClass);
        if (null != parameters && !parameters.isEmpty()) {
            parameters.forEach(query::setParameter);
        }
        return query.uniqueResult();
    }


    @Override
    public <T> void save(T model) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(model);
        transaction.commit();
    }


//    @Override
//    public User getByUsername(String username) {
//        Session session = sessionFactory.openSession();
//
//        try {
//            String hql = "FROM User WHERE username = :username";
//            Query<User> query = session.createQuery(hql, User.class);
//            query.setParameter("username", username);
//            return query.uniqueResult();
//        } finally {
//            session.close();
//        }
//    }
}



