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

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "workout_id")
    private Workout workout;

    @Column(name = "image_uri")
    private String imageUri;

    public Post(UUID userId, String postText) {
        this.userId = userId;
        this.postText = postText;
    }

    public Post(UUID userId, String postText, Workout workout, String imageUri) {
        this.userId = userId;
        this.postText = postText;
        this.workout = workout;
        this.imageUri = imageUri;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Post )) return false;
        return postId != null && postId.equals(((Post) o).getPostId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}

