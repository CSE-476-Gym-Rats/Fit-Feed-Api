package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.PostRepository;
import com.example.fitfeed.api.models.Post;
import com.example.fitfeed.api.models.Workout;
import com.example.fitfeed.api.models.dto.PostRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import java.util.List;
import java.util.UUID;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostRepository postRepository;

    @Autowired
    private WorkoutService workoutService;

    @Override
    public Post savePost(PostRequest postRequest)
    {
        Workout workout = workoutService.getWorkoutById(postRequest.workoutId);
        if (workout == null) {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND, "Workout with id=" + postRequest.workoutId + " not found");
        }
        Post savedPost = postRepository.save(postRequest.toPost(workout));
        workout.addPost(savedPost);
        return postRepository.findById(savedPost.getPostId()).orElse(null);
    }

    @Override
    public List<Post> getPostsForUserId(UUID userId) {
        return postRepository.findAllByUserId(userId);
    }

    @Override
    public Post getPostById(Long postId) {
        return postRepository.findById(postId).orElse(null);
    }

    @Override
    public Post updatePost(Post post) {
        return null; // todo
    }

    @Override
    public void deletePostById(Long postId) {
        postRepository.deleteById(postId);
    }
}
