package com.grocery.service;

import com.grocery.model.User;

public interface UserService {
    void registerUser(User user);
    User loadUser(String username);
    boolean validateUser(String username, String password);
    User getUserByUsername(String username);
}
