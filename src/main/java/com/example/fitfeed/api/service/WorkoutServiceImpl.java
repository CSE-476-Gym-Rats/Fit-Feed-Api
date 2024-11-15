package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.WorkoutRepository;
import com.example.fitfeed.api.models.Exercise;
import com.example.fitfeed.api.models.Workout;
import com.example.fitfeed.api.models.dto.ExerciseRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class WorkoutServiceImpl implements WorkoutService {

    @Autowired
    private WorkoutRepository workoutRepository;

    @Autowired
    private ExerciseService exerciseService;

    @Override
    public Workout saveWorkout(Workout workout, List<ExerciseRequest> exercises) {
        Workout savedWorkout = workoutRepository.save(workout);
        exercises.forEach(exercise -> {
            Exercise createdExercise = exerciseService.createExercise(exercise.toExercise(savedWorkout));
            savedWorkout.addExercise(createdExercise);
        });
        return savedWorkout;
    }

    @Override
    public List<Workout> getWorkoutsForUserId(UUID userId) {
        return workoutRepository.findAllByUserId(userId);
    }

    @Override
    public Workout getWorkoutById(Long workoutId) {
        return workoutRepository.findById(workoutId).orElse(null);
    }

    @Override
    public Workout updateWorkout(Workout workout) {
        return null; // todo
    }

    @Override
    public void deleteWorkoutById(Long workoutId) {
        workoutRepository.deleteById(workoutId);
    }
}
