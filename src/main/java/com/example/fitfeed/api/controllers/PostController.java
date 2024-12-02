package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.Post;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.PostRequest;
import com.example.fitfeed.api.service.FriendService;
import com.example.fitfeed.api.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private FriendService friendService;

    @PostMapping("/post")
    public @ResponseBody ResponseEntity<Post> createPost(JwtAuthenticationToken auth, @RequestBody PostRequest postRequest) {
        if (postRequest.userId == null) { postRequest.userId = UUID.fromString(auth.getToken().getSubject()); }
        Post post = postService.savePost(postRequest);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(post);
    }

    @GetMapping("/posts")
    public @ResponseBody ResponseEntity<List<Post>> getPosts(JwtAuthenticationToken auth) {
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(postService.getPostsForUserId(
                        UUID.fromString(auth.getToken().getSubject())
                ));
    }

    @GetMapping("/user-posts/{user-id}")
    public @ResponseBody ResponseEntity<List<Post>> getPostsForUser(@PathVariable("user-id") UUID userId) {
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(postService.getPostsForUserId(userId));
    }

    @GetMapping("/all-posts")
    public @ResponseBody ResponseEntity<List<Post>> getAllPosts(JwtAuthenticationToken auth) {
        UUID userId = UUID.fromString(auth.getToken().getSubject());
        List<User> friends = friendService.getFriendsForUser(userId);

        ArrayList<Post> posts = new ArrayList<>();
        List<Post> userPosts = postService.getPostsForUserId(userId);
        if (!userPosts.isEmpty()) { posts.addAll(userPosts); }

        for (User friend : friends) {
            List<Post> friendPosts = postService.getPostsForUserId(friend.getId());
            if (!friendPosts.isEmpty()) {
                posts.addAll(friendPosts);
            }
        }

        posts.sort(Comparator.comparing((Post p) -> p.getWorkout().getWorkoutTimestamp()).reversed());

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(posts);
    }

    @GetMapping("/post/{post-id}")
    public @ResponseBody ResponseEntity<Post> getPost(@PathVariable(name = "post-id") Long postId) {
        Post post = postService.getPostById(postId);
        if (post != null) {
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body(post);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @DeleteMapping("/post/{post-id}")
    public @ResponseBody ResponseEntity<String> deletePost(@PathVariable(name = "post-id") Long postId) {
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
