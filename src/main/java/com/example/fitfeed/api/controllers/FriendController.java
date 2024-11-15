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
    public ResponseEntity<Friend> addFriend(JwtAuthenticationToken auth, @RequestBody FriendRequest friendRequest) {
        try {
            // Get current user id from JWT
            UUID userId = UUID.fromString(auth.getToken().getSubject());

            // Get friend user id from request
            UUID friendId = friendRequest.getFriendId();

            // Call the service to add the friend
            Friend friend = friendService.saveFriend(userId, friendId);

            // Return response
            return ResponseEntity.status(HttpStatus.CREATED).body(friend);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }

    // Endpoint to delete a friend
    @DeleteMapping("/friends/{friendId}")
    public ResponseEntity<String> deleteFriend(JwtAuthenticationToken auth, @PathVariable UUID friendId) {
        try {
            UUID userId = UUID.fromString(auth.getToken().getSubject());

            // Logic to delete the friend (You need to implement this logic in the service)
            friendService.deleteFriend(userId, friendId);

            return ResponseEntity.status(HttpStatus.OK).body("Friendship deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed to delete friend");
        }
    }
}
