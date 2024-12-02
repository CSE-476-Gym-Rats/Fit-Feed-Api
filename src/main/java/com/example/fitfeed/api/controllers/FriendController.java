package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.FriendLink;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.FriendRequest;
import com.example.fitfeed.api.service.FriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
public class FriendController {

    @Autowired
    private FriendService friendService;

    @PostMapping("/friend")
    public @ResponseBody ResponseEntity<FriendLink> addFriend(JwtAuthenticationToken auth, @RequestBody FriendRequest friendRequest) {
        if (friendRequest.userId == null) { friendRequest.userId = UUID.fromString(auth.getToken().getSubject()); }
        FriendLink friendLink = friendService.createFriendLink(friendRequest);
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(friendLink);
    }

    @GetMapping("/friends")
    public @ResponseBody ResponseEntity<List<User>> getFriends(JwtAuthenticationToken auth) {
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(friendService.getFriendsForUser(
                        UUID.fromString(auth.getToken().getSubject())
                ));
    }

    @Transactional
    @DeleteMapping("/friend/{friend-user-id}")
    public @ResponseBody ResponseEntity<String> removeFriend(JwtAuthenticationToken auth, @PathVariable(name = "friend-user-id") UUID friendUserId) {
        UUID userId = UUID.fromString(auth.getToken().getSubject());
        List<User> userFriends = friendService.getFriendsForUser(userId);

        if (userFriends.stream().anyMatch(f -> f.getId().equals(friendUserId))) {
            friendService.deleteFriendLinkByUserIds(userId, friendUserId);
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body("Deleted");
        } else {
            return ResponseEntity.notFound().build();
        }
    }

}
