package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.PostRepository;
import com.example.fitfeed.api.modelsPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostRepository postRepository;

    @Override
    public Post savePost(PostRequest postRequest) {
        Post savedPost = postRepository.save(postRequest);
        return postRepository.findById(Post.getWorkoutId()).orElse(null);
    }

    @Override
    public List<Post> gePostsForUserId(UUID userId) {
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
