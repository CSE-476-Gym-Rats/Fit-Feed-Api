package com.example.fitfeed.api.models.dto;

import com.example.fitfeed.api.models.Exercise;
import com.example.fitfeed.api.models.Workout;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ExerciseRequest {

    @JsonProperty(required = true)
    public String exerciseName;

    @JsonProperty(required = true)
    public Integer sets;

    @JsonProperty(required = true)
    public Integer reps;

    @JsonProperty(required = true)
    public Float weight;

    public Exercise toExercise(Workout workout) {
        return new Exercise(
                this.exerciseName,
                this.sets,
                this.reps,
                this.weight,
                workout
        );
    }
}
