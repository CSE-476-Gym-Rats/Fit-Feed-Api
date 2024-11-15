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
    private UUID friendId;  // The ID of the friend being added

    @Column(name = "user_id", nullable = false)
    private UUID userId;  // The ID of the user who is adding the friend

    public Friend(UUID userId, UUID friendId) {
        this.userId = userId;
        this.friendId = friendId;
    }
}
