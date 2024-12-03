package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.PostRepository;
import com.example.fitfeed.api.models.Post;
import com.example.fitfeed.api.models.Workout;
import com.example.fitfeed.api.models.dto.PostRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
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

    @Autowired
    private KeycloakService keycloakService;

    @Override
    public Post savePost(PostRequest postRequest)
    {
        Workout workout = workoutService.getWorkoutById(postRequest.workoutId);

        if (workout == null) throw HttpClientErrorException.NotFound.create(HttpStatus.NOT_FOUND, "Workout with id=" + postRequest.workoutId + " not found", new HttpHeaders(), null, null);

        Post savedPost = postRepository.save(postRequest.toPost(workout));
        workout.addPost(savedPost);

        Post returnPost = postRepository.findById(savedPost.getPostId()).orElse(null);
        if (returnPost != null) returnPost.setUsername(keycloakService.userSearch(returnPost.getUserId()).getUsername());

        return returnPost;
    }

    @Override
    public List<Post> getPostsForUserId(UUID userId) {
        List<Post> posts = postRepository.findAllByUserId(userId);
        posts.forEach(p -> p.setUsername(keycloakService.userSearch(p.getUserId()).getUsername()));
        return posts;
    }

    @Override
    public Post getPostById(Long postId) {
        Post post = postRepository.findById(postId).orElse(null);
        if (post != null) post.setUsername(keycloakService.userSearch(post.getUserId()).getUsername());
        return post;
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
