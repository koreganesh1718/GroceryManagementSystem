package com.grocery.service;

import com.grocery.dao.UserDAO;
import com.grocery.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void registerUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("USER");
        userDAO.saveUser(user);
    }

    @Override
    public User loadUser(String username) {
        return userDAO.findByUsername(username);
    }

    @Override
    public boolean validateUser(String username, String rawPassword) {

        User user = userDAO.getUserByUsername(username);

        if (user == null) {
            return false;
        }

        return passwordEncoder.matches(rawPassword, user.getPassword());
    }

    @Override
    public User getUserByUsername(String username) {   // ⭐ ADD THIS
        return userDAO.getUserByUsername(username);
    }
}
