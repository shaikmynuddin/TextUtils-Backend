package com.codewitharjun.fullstackbackend.controller;

import com.codewitharjun.fullstackbackend.model.User;
import com.codewitharjun.fullstackbackend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/* Created by Arjun Gautam */
@RestController
@CrossOrigin(origins = "*", allowedHeaders = "*")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/user")
    public User newUser(@RequestBody User newUser) {
        User savedUser = userRepository.save(newUser);
        return savedUser;
    }

    @GetMapping("/notes")
    public List<User> getAllNotes() {
        return userRepository.findAll();
    }
}
