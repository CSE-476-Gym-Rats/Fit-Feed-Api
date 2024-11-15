package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.Post;
import com.example.fitfeed.api.models.dto.PostRequest;
import com.example.fitfeed.api.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
public class PostController {

    @Autowired
    private PostService postService;

    @PostMapping("/makepost")
    public @ResponseBody ResponseEntity<Post> createPost(JwtAuthenticationToken auth, @RequestBody PostRequest postRequest) {
        Post post = postService.savePost(
                postRequest
                //postRequest.toPost(UUID.fromString(auth.getToken().getSubject())),
                //workoutRequest.exercises.stream().toList()
        );
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(post);
    }

    @GetMapping("/getposts")
    public @ResponseBody ResponseEntity<List<Post>> getPosts(JwtAuthenticationToken auth) {
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(postService.getPostsForUserId(
                        UUID.fromString(auth.getToken().getSubject())
                ));
    }

    @GetMapping("/getposts/{post-id}")
    public @ResponseBody ResponseEntity<Post> getPost(JwtAuthenticationToken auth, @PathVariable(name = "post-id") Long postId) {
        Post post = postService.getPostById(postId);
        if (post != null) {
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(post);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/getposts/{post-id}")
    public @ResponseBody ResponseEntity<String> deletePost(JwtAuthenticationToken auth, @PathVariable(name = "post-id") Long postId) {
        Post post = postService.getPostById(postId);
        if (post != null) {
            postService.deletePostById(postId);
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body("Deleted");
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
