package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.FriendRepository;
import com.example.fitfeed.api.models.Friend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FriendServiceImpl implements FriendService {

    @Autowired
    private friendRepository friendRepository;

    @Override
    public Friend createFriend(Friend friend) {
        return friendRepository.save(friend);
    }

    @Override
    public Friend getFriendById(Long friendId) {
        return friendRepository.findById(friendId).orElse(null);
    }

    @Override
    public void deleteFriendById(Long friendId) {
        friendRepository.deleteById(friendId);
    }
}
