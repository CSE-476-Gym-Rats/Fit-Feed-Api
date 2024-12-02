package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Token;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.KeycloakUserRequest;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import java.util.UUID;

public interface KeycloakService {
    public Token login(String username, String password);

    public String register(KeycloakUserRequest keycloakUserRequest);

    public User[] userSearch(String username);
    public User userSearch(UUID userId);
}
