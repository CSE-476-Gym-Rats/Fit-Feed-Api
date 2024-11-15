package com.example.fitfeed.api.models.dto;

import com.example.fitfeed.api.controllers.PostController;
import com.example.fitfeed.api.models.Post;
import com.example.fitfeed.api.models.Workout;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

public class PostRequest {

    @JsonProperty
    public UUID userId;

    @JsonProperty(required = true)
    public String postText;

    @JsonProperty(required = true)
    public Long workoutId;

    @JsonProperty
    public String imageUri;

    public Post toPost(Workout workout) {
        return new Post(
                this.userId,
                this.postText,
                workout,
                this.imageUri
        );
    }
}
