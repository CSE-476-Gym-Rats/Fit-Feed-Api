package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Workout;
import com.example.fitfeed.api.models.dto.ExerciseRequest;

import java.util.List;
import java.util.UUID;

public interface WorkoutService {
    Workout saveWorkout(Workout workout, List<ExerciseRequest> exercises);

    List<Workout> getWorkoutsForUserId(UUID userId);

    Workout getWorkoutById(Long workoutId);

    Workout updateWorkout(Workout workout);

    void deleteWorkoutById(Long workoutId);
}
