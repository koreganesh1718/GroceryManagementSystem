package com.grocery.dao;

import com.grocery.model.Address;

public interface AddressDAO {

    Address getAddress(String username);
    void saveAddress(Address address);
    void updateAddress(Address address);
}
