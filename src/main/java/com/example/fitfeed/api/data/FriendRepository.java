package com.example.fitfeed.api.data;

import com.example.fitfeed.api.models.Friend;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.UUID;

public interface FriendRepository extends CrudRepository<Friend, Long> {
    

}