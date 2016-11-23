package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Follow;

public interface FollowService {

	int registerFollow(Follow follow);
	int removeFollow(Follow follow);
	
	// 추가
	int confirmFollow(Follow follow);
	List<Follow> findRequestedFollows(String userId);
	public boolean checkRequest(String userId, String followId);
	// 
	
	List<Follow> findAll(String userId);
	List<Follow> findFollowsByConnChain(String userId, String connChain);
	List<Follow> findFollowsByRelation(Follow follow);
}
