package com.grocery.test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Demo {
    public static void main(String[] args){
        System.out.println(new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder().encode("manager123"));
    }
}