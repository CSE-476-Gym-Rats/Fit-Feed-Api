package com.example.fitfeed.api.models.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class KeycloakUserRequest {

    @JsonProperty(required = true)
    public String firstName;

    @JsonProperty(required = true)
    public String lastName;

    @JsonProperty(required = true)
    public String username;

    @JsonProperty(required = true)
    public String email;

    @JsonProperty(required = true)
    public boolean enabled = true;

    @JsonProperty(required = true)
    public List<Credential> credentials;

    public static class Credential {

        @JsonProperty(required = true)
        public final String type = "password";
        @JsonProperty(required = true)
        public final boolean temporary = false;

        @JsonProperty(required = true)
        public String value;
    }
}
