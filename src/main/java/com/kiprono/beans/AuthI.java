package com.kiprono.beans;


import com.kiprono.models.User;

import javax.ejb.Local;

@Local
public interface AuthI<T> {
    User login(String username, String password);
    boolean logout(T t);
}
