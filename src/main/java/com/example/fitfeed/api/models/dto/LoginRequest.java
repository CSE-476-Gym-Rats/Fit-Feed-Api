package com.example.fitfeed.api.models.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class LoginRequest {

    @JsonProperty(required = true)
    public String username;

    @JsonProperty(required = true)
    public String password;

}
