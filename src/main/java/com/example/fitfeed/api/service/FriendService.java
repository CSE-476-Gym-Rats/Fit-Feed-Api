package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.FriendLink;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.FriendRequest;

import java.util.List;
import java.util.UUID;

public interface FriendService {

    public FriendLink createFriendLink(FriendRequest friendRequest);

    public List<User> getFriendsForUser(UUID userId);

    public FriendLink getFriendLink(Long linkId);

    public void deleteFriendLinkByUserIds(UUID userId, UUID friendUserId);
}
