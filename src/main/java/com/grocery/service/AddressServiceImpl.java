package com.grocery.service;

import com.grocery.dao.AddressDAO;
import com.grocery.model.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressDAO addressDAO;

    @Override
    public Address getAddress(String username) {
        return addressDAO.getAddress(username);
    }

    @Override
    public void saveOrUpdate(Address a) {
        Address exists = addressDAO.getAddress(a.getUsername());

        if (exists == null) {
            addressDAO.saveAddress(a);
        } else {
            addressDAO.updateAddress(a);
        }
    }
}
