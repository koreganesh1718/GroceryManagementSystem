package com.grocery.dao;

import com.grocery.model.User;

public interface UserDAO {
    void saveUser(User user);
    User findByUsername(String username);
    boolean validateUser(String username, String password);
    User getUserByUsername(String username);
}
