package com.example.fitfeed.api.data;

import com.example.fitfeed.api.models.Post;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.UUID;

public interface PostRepository extends CrudRepository<Post, Long> {

    List<Post> findAllByUserId(UUID userId);

}
