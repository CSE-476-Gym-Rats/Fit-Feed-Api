package com.example.fitfeed.api.models;

import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter @Setter
public class User {

    private UUID id;

    private String username;

    public User(UUID id, String username) {
        this.id = id;
        this.username = username;
    }

}
