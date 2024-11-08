package com.example.fitfeed.api.data;

import com.example.fitfeed.api.models.Workout;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.UUID;

public interface WorkoutRepository extends CrudRepository<Workout, Long> {

    List<Workout> findAllByUserId(UUID userId);

}
