package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.Token;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.KeycloakUserRequest;
import com.example.fitfeed.api.models.dto.LoginRequest;
import com.example.fitfeed.api.service.KeycloakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.UUID;

@RestController
public class KeycloakController {

    @Autowired
    KeycloakService keycloakService;

    @PostMapping("/login")
    public @ResponseBody Token login(@RequestBody LoginRequest loginRequest) {
        return keycloakService.login(loginRequest.username, loginRequest.password);
    }

    @PostMapping("/register")
    public @ResponseBody String register(@RequestBody KeycloakUserRequest keycloakUserRequest) {
        return keycloakService.register(keycloakUserRequest);
    }

    @GetMapping("/search")
    public @ResponseBody User[] userSearch(@RequestParam(name = "username", required = false) String username, @RequestParam(name = "user-id", required = false) UUID userId) {
        return (userId != null) ? new User[]{keycloakService.userSearch(userId)} : keycloakService.userSearch(username);
    }

}
