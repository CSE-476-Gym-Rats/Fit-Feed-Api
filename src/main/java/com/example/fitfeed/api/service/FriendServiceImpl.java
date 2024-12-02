package com.example.fitfeed.api.service;

import com.example.fitfeed.api.data.FriendRepository;
import com.example.fitfeed.api.models.FriendLink;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.FriendRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpClientErrorException;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class FriendServiceImpl implements FriendService {

    @Autowired
    private FriendRepository friendRepository;

    @Autowired
    private KeycloakService keycloakService;

    @Override
    public FriendLink createFriendLink(FriendRequest friendRequest) {
        if (friendRepository.findByUserId(friendRequest.userId).stream().anyMatch(friendLink -> friendLink.getFriendID().equals(friendRequest.friendUserId))) {
            throw new HttpClientErrorException(HttpStatus.CONFLICT, "Friend already exists");
        }

        User userById = null;
        User userByUsername = null;
        if (friendRequest.friendUserId != null) {
            userById = keycloakService.userSearch(friendRequest.friendUserId);
        }
        if (friendRequest.friendUsername != null) {
            User[] users = keycloakService.userSearch(friendRequest.friendUsername);
            if (users.length > 1) {
                throw new HttpClientErrorException(HttpStatus.INTERNAL_SERVER_ERROR, "More than one user with Username = " + friendRequest.friendUsername);
            } else if (users.length == 1) {
                userByUsername = users[0];
            }
        }
        if (userById == null && userByUsername == null) {
            throw new HttpClientErrorException(HttpStatus.NOT_FOUND, "User not found");
        }

        UUID idA = friendRequest.userId;
        UUID idB = (userById != null) ? userById.getId() : userByUsername.getId();
        friendRepository.save(new FriendLink(idB, idA));
        return friendRepository.save(new FriendLink(idA, idB));
    }

    @Override
    public List<User> getFriendsForUser(UUID userId) {
        List<FriendLink> friendLinks = friendRepository.findByUserId(userId);
        List<User> friends = new ArrayList<>();
        friendLinks.forEach(friendLink -> {
            friends.add(keycloakService.userSearch(friendLink.getFriendID()));
        });
        return friends;
    }

    @Override
    public FriendLink getFriendLink(Long linkId) {
        return friendRepository.findById(linkId).orElse(null);
    }

    @Override
    public void deleteFriendLinkByUserIds(UUID userId, UUID friendUserId) {
        friendRepository.deleteByFriendIDAndUserId(userId, friendUserId);
        friendRepository.deleteByFriendIDAndUserId(friendUserId, userId);
    }

}
