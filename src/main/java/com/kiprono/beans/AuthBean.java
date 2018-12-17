package com.kiprono.beans;


import com.kiprono.models.User;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class AuthBean<T> implements AuthI<T> {
    @PersistenceContext
    EntityManager entityManager;

    @Override
    public User login(String username, String password) {
        try {
           return (User) entityManager.createNamedQuery("User.fetchUser").setParameter("username", username).setParameter("password", password).getSingleResult();

       //     return (User) entityManager.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password").getSingleResult();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return null;
        //   return query.getResultList().size() > 0 ? true : false;


    }
    @Override
    public boolean logout(T t) {
        return false;
    }
}
