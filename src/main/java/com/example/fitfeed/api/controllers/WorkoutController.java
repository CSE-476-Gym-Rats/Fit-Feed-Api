package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.Workout;
import com.example.fitfeed.api.models.dto.WorkoutRequest;
import com.example.fitfeed.api.service.WorkoutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
public class WorkoutController {

    @Autowired
    private WorkoutService workoutService;

    @PostMapping("/workout")
    public @ResponseBody ResponseEntity<Workout> createWorkout(JwtAuthenticationToken auth, @RequestBody WorkoutRequest workoutRequest) {
        Workout workout = workoutService.saveWorkout(
                workoutRequest.toWorkout(UUID.fromString(auth.getToken().getSubject())),
                workoutRequest.exercises.stream().toList()
        );
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(workout);
    }

    @GetMapping("/workouts")
    public @ResponseBody ResponseEntity<List<Workout>> getWorkouts(JwtAuthenticationToken auth) {
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(workoutService.getWorkoutsForUserId(
                        UUID.fromString(auth.getToken().getSubject())
                ));
    }

    @GetMapping("/workout/{workout-id}")
    public @ResponseBody ResponseEntity<Workout> getWorkout(JwtAuthenticationToken auth, @PathVariable(name = "workout-id") Long workoutId) {
        Workout workout = workoutService.getWorkoutById(workoutId);
        if (workout != null) {
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(workout);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/workout/{workout-id}")
    public @ResponseBody ResponseEntity<String> deleteWorkout(JwtAuthenticationToken auth, @PathVariable(name = "workout-id") Long workoutId) {
        Workout workout = workoutService.getWorkoutById(workoutId);
        if (workout != null) {
            workoutService.deleteWorkoutById(workoutId);
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body("Deleted");
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
