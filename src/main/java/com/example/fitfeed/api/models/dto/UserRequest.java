package com.example.fitfeed.api.models.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class UserRequest {

    @JsonProperty(required = true)
    public String first_name;

    @JsonProperty(required = true)
    public String last_name;

    @JsonProperty(required = true)
    public String username;

    @JsonProperty(required = true)
    public String password;

    @JsonProperty(required = true)
    public String email;

}
