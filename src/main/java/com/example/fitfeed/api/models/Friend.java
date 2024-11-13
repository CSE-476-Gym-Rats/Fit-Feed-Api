package com.example.fitfeed.api.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Entity
@Getter @Setter @NoArgsConstructor
public class Friend {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "friend_id")
    private UUID friendId;

    @Column(name = "user_id", nullable = false)
    private UUID userId;

    public Friend(UUID userId, UUID friend_id) {
        this.userId = userId;
        this.friendId = friend_id
    }

}

