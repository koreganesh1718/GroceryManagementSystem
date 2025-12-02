package com.grocery.dao;

import com.grocery.model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAOImpl implements AddressDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Address getAddress(String username) {
        try {
            String sql = "SELECT * FROM g_address WHERE username = ?";
            return jdbcTemplate.queryForObject(sql, (rs, rowNum) -> {
                Address a = new Address();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setFullName(rs.getString("fullName"));
                a.setMobile(rs.getString("mobile"));
                a.setHouseNo(rs.getString("houseNo"));
                a.setStreet(rs.getString("street"));
                a.setCity(rs.getString("city"));
                a.setState(rs.getString("state"));
                a.setPincode(rs.getString("pincode"));
                return a;
            }, username);
        } catch (Exception e) {
            return null; // user has no address yet
        }
    }

    @Override
    public void saveAddress(Address a) {
        String sql = """
            INSERT INTO g_address(username, fullName, mobile, houseNo, street, city, state, pincode)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """;

        jdbcTemplate.update(sql, a.getUsername(), a.getFullName(), a.getMobile(),
                a.getHouseNo(), a.getStreet(), a.getCity(), a.getState(), a.getPincode());
    }

    @Override
    public void updateAddress(Address a) {
        String sql = """
            UPDATE g_address SET fullName=?, mobile=?, houseNo=?, street=?, 
            city=?, state=?, pincode=? WHERE username=?
        """;

        jdbcTemplate.update(sql, a.getFullName(), a.getMobile(), a.getHouseNo(),
                a.getStreet(), a.getCity(), a.getState(), a.getPincode(),
                a.getUsername());
    }
}
