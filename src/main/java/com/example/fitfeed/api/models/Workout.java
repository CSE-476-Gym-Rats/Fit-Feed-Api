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
public class Workout {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "workout_id")
    private Long workoutId;

    @Column(name = "user_id", nullable = false)
    private UUID userId;

    @Column(name = "workout_name", nullable = false)
    private String workoutName;

    @Column(name = "workout_timestamp", nullable = false)
    private Long workoutTimestamp;

    @OneToMany(mappedBy = "workout", cascade = CascadeType.ALL, orphanRemoval = true)
    private Set<Exercise> exercises = new HashSet<>();

    public Workout(UUID userId, String workoutName, Long workoutTimestamp) {
        this.userId = userId;
        this.workoutName = workoutName;
        this.workoutTimestamp = workoutTimestamp;
    }

    public void addExercise(Exercise exercise) {
        this.exercises.add(exercise);
        exercise.setWorkout(this);
    }

    public void removeExercise(Exercise exercise) {
        this.exercises.remove(exercise);
        exercise.setWorkout(null);
    }
}

