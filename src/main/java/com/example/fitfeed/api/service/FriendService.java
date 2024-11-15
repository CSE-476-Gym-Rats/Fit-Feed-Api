package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Friend;

public interface FriendService {
    public Friend createFriend(Friend friend);

    public Friend getFriendById(Long friendId);

    public Friend updateFriend(Friend friend);

    public void deleteFriendById(Long friendId);
}
