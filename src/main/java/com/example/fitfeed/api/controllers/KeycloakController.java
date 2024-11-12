package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.Token;
import com.example.fitfeed.api.models.dto.LoginRequest;
import com.example.fitfeed.api.service.KeycloakService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class KeycloakController {

    @Autowired
    KeycloakService keycloakService;

    @PostMapping("/login")
    public @ResponseBody Token login(@RequestBody LoginRequest loginRequest) {
        return keycloakService.login(loginRequest.username, loginRequest.password);
    }

}