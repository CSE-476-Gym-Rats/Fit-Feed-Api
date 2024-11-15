package com.example.fitfeed.api.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter @Setter @NoArgsConstructor
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "exercise_id")
    private Long id;

    @Column(name = "exercise_name", nullable = false)
    private String exerciseName;

    @Column(name = "exercise_sets", nullable = true)
    private Integer sets;

    @Column(name = "exercise_reps", nullable = true)
    private Integer reps;

    @Column(name = "exercise_weight", nullable = true)
    private Float weight;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "workout_id", nullable = false)
    @JsonBackReference
    private Workout workout;

    public Exercise(String exerciseName, Integer sets, Integer reps, Float weight, Workout workout) {
        this.exerciseName = exerciseName;
        this.sets = sets;
        this.reps = reps;
        this.weight = weight;
        this.workout = workout;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Exercise )) return false;
        return id != null && id.equals(((Exercise) o).getId());
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
