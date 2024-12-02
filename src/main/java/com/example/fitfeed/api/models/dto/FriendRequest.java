package com.example.fitfeed.api.models.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.UUID;

public class FriendRequest {

    @JsonProperty(required = false)
    public String username;

    @JsonProperty(required = false)
    public UUID userId;

    @JsonProperty(required = false)
    public String friendUsername;

    @JsonProperty(required = false)
    public UUID friendUserId;

}
