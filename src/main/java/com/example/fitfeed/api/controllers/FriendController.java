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

    @Autowired
    private UserService userService; // Service to get user information by username

    // Endpoint to add a friend
    @PostMapping("/friends")
    public ResponseEntity<Friend> addFriend(JwtAuthenticationToken auth, @RequestBody FriendRequest friendRequest) {
        try {
            // Get current user's username from JWT (assuming the username is stored in the JWT's subject)
            String username = auth.getToken().getSubject();

            // Get the friend's username from the request
            String friendUsername = friendRequest.getFriendUsername();

            // Get user and friend IDs from usernames using the UserService
            UUID userId = userService.getUserIdByUsername(username);
            UUID friendId = userService.getUserIdByUsername(friendUsername);

            if (userId == null || friendId == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null); // User or friend not found
            }

            // Call the service to add the friend relationship
            Friend friend = friendService.saveFriend(userId, friendId);

            // Return response with the created friend relationship
            return ResponseEntity.status(HttpStatus.CREATED).body(friend);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null); // Handle exceptions
        }
    }

    // Endpoint to delete a friend
    @DeleteMapping("/friends/{friendUsername}")
    public ResponseEntity<String> deleteFriend(JwtAuthenticationToken auth, @PathVariable String friendUsername) {
        try {
            // Get current user's username from JWT
            String username = auth.getToken().getSubject();

            // Get user and friend IDs from usernames
            UUID userId = userService.getUserIdByUsername(username);
            UUID friendId = userService.getUserIdByUsername(friendUsername);

            if (userId == null || friendId == null) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User or friend not found");
            }

            // Call the service to delete the friend relationship
            friendService.deleteFriend(userId, friendId);

            return ResponseEntity.status(HttpStatus.OK).body("Friendship deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to delete friend");
        }
    }
}
