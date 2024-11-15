package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Post;

import java.util.List;
import java.util.UUID;

public interface PostService {
    Post savePost(Post post);

    List<Post> getPostsForUserId(UUID userId);

    Post getPostById(Long postId);

    Post updatePost(Post post);

    void deletePostById(Long postId);
}
