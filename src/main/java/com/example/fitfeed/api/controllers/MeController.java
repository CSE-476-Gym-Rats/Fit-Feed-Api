package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.User;
import org.springframework.security.oauth2.core.oidc.StandardClaimNames;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
public class MeController {
    @GetMapping("/me")
    public User getGreeting(JwtAuthenticationToken auth) {
        return new User(
                UUID.fromString(auth.getToken().getSubject()),
                auth.getToken().getClaimAsString(StandardClaimNames.PREFERRED_USERNAME));
    }
}
