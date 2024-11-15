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
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "post_id")
    private Long postId;

    @Column(name = "user_id", nullable = false)
    private UUID userId;

    @Column(name = "post_text", nullable = false)
    private String postText;

    @Column(name = "workout_id")
    private Long workoutId;

    public Post(UUID userId, Long workoutId, String postText) {
        this.userId = userId;
        this.workoutId = workoutId;
        this.postText = postText;
    }
}

