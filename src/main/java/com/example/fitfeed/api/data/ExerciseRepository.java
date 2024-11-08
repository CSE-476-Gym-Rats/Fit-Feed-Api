package com.example.fitfeed.api.data;

import com.example.fitfeed.api.models.Exercise;
import org.springframework.data.repository.CrudRepository;

public interface ExerciseRepository extends CrudRepository<Exercise, Long> {

}
