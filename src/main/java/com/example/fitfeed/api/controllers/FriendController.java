package com.example.fitfeed.api.controllers;

import com.example.fitfeed.api.models.Friend;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
public class FriendController {

    @Autowired
    private FriendService friendService;

    // Endpoint to add a friend
    @PostMapping("/friends")
    public @ResponseBody ResponseEntity<Friend> createFriend(JwtAuthenticationToken auth, @RequestBody FriendRequest friendRequest) {
        Friend friend = friendService.saveFriend(
                friendRequest.toFriend(UUID.fromString(auth.getToken().getSubject())),
                friendRequest.exercises.stream().toList()
        );
        return ResponseEntity
                .status(HttpStatus.CREATED)
                .body(Friend);
    }

    // Allows the users to delete friends
    @DeleteMapping("/friends/{user_id}")
    public @ResponseBody ResponseEntity<String> deleteFriend(JwtAuthenticationToken auth, @PathVariable(name = "Friend-id") Long friendId) {
        Friend friend = friendService.getFriendById(friendId);
        if (friend != null) {
            friendService.deleteFriendById(friendId);
            return ResponseEntity
                    .status(HttpStatus.OK)
                    .body("Deleted");
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
