package com.example.fitfeed.api.data;

import com.example.fitfeed.api.models.FriendLink;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.UUID;

public interface FriendRepository extends CrudRepository<FriendLink, Long> {

    void deleteByFriendIDAndUserId(UUID userId, UUID friendId);

    List<FriendLink> findByUserId(UUID friendId);

}
