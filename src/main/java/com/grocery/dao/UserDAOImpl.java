package com.grocery.dao;

import com.grocery.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void saveUser(User user) {
        String sql = "INSERT INTO g_users(username, password, role) VALUES(?, ?, ?)";
        jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getRole());
    }

    @Override
    public User getUserByUsername(String username) {
        try {
            String sql = "SELECT * FROM g_users WHERE username = ?";
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                return u;
            }, username);
        } catch (Exception e) {
            return null;   // ⭐ FIX: return null instead of throwing exception
        }
    }

    @Override
    public User findByUsername(String username) {
        return getUserByUsername(username);  // reuse
    }

    @Override
    public boolean validateUser(String username, String rawPassword) {
        User u = getUserByUsername(username);
        if (u == null) return false;
        return new BCryptPasswordEncoder().matches(rawPassword, u.getPassword());
    }
}
