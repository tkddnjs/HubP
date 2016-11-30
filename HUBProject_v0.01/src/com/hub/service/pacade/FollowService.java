package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Follow;

public interface FollowService {

	int requestFollow(Follow follow);
	int removeFollow(Follow follow);
	int confirmFollow(Follow follow);
	boolean checkFollowRequested(String userId, String followId);
	List<Follow> findAll(String userId);
	List<Follow> findRequestedFollows(String userId);
	List<Follow> findFollowsByRelation(String userId, int relation);
}
