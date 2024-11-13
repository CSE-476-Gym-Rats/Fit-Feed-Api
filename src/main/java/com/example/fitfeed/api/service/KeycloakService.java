package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Token;
import com.example.fitfeed.api.models.dto.KeycloakUserRequest;

public interface KeycloakService {
    public Token login(String username, String password);

    public String register(KeycloakUserRequest keycloakUserRequest);
}
