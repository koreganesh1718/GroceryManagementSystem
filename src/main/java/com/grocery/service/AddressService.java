package com.grocery.service;

import com.grocery.model.Address;

public interface AddressService {

    Address getAddress(String username);
    void saveOrUpdate(Address address);
}
