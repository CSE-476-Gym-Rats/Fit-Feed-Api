package com.example.fitfeed.api.models.dto;

import com.example.fitfeed.api.controllers.WorkoutController;
import com.example.fitfeed.api.models.Exercise;
import com.example.fitfeed.api.models.Workout;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

public class WorkoutRequest {

    public UUID userId;

    @JsonProperty(required = true)
    public String workoutName;

    @JsonProperty(required = true)
    public Long workoutTimestamp;

    @JsonProperty(required = true)
    public Set<ExerciseRequest> exercises;

    public Workout toWorkout() {
        return new Workout(
                this.userId,
                this.workoutName,
                this.workoutTimestamp
        );
    }

    public Workout toWorkout(UUID userId) {
        return new Workout(
                userId,
                this.workoutName,
                this.workoutTimestamp
        );
    }
}
