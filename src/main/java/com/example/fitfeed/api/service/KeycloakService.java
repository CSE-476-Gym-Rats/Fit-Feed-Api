package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Token;

public interface KeycloakService {
    public Token login(String username, String password);
}
