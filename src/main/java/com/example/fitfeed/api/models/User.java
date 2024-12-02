package com.example.fitfeed.api.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import lombok.Getter;
import lombok.Setter;

import java.util.UUID;

@Getter @Setter
@Entity  // This annotation is necessary for JPA to manage the class as an entity
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private UUID id;

    private String username;

    public User(UUID id, String username) {
        this.id = id;
        this.username = username;
    }

    public User() {
    }

    public UUID getUserId() {
            return id;
    }

}
