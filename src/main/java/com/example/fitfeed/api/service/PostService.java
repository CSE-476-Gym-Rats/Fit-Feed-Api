package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Post;
import com.example.fitfeed.api.models.dto.PostRequest;

import java.util.List;
import java.util.UUID;

public interface PostService {
    Post savePost(PostRequest postRequest);

    List<Post> getPostsForUserId(UUID userId);

    Post getPostById(Long postId);

    Post updatePost(Post post);

    void deletePostById(Long postId);
}
