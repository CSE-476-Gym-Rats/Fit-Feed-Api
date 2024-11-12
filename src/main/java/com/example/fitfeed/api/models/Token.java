package com.example.fitfeed.api.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter @AllArgsConstructor
public class Token {

    private String access_token;

    private int expires_in;

    private int refresh_expires_in;

    private String refresh_token;

    private String token_type;

    @JsonProperty("not-before-policy")
    private int not_before_policy;

    private String session_state;

    private String scope;

}
