package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Exercise;

public interface ExerciseService {
    public Exercise createExercise(Exercise exercise);

    public Exercise getExerciseById(Long exerciseId);

    public Exercise updateExercise(Exercise exercise);

    public void deleteExerciseById(Long exerciseId);
}
