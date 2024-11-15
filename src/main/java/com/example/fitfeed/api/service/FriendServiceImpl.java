package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.FriendRepository;
import com.example.fitfeed.api.models.Friend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FriendService implements FriendService{

    @Autowired
    private FriendRepository friendRepository;

    // Method to save a friend relationship
    public Friend saveFriend(UUID userId, UUID friendId) {
        // Check if the user is already friends with the friend
        if (isFriendAlready(userId, friendId)) {
            throw new IllegalArgumentException("Friendship already exists");
        }

        // Create new friend entity
        Friend friend = new Friend(userId, friendId);
        return friendRepository.save(friend);
    }

    // Check if the user is already friends with the friend
    private boolean isFriendAlready(UUID userId, UUID friendId) {
        return friendRepository.existsById(userId) && friendRepository.existsById(friendId);
    }

}
