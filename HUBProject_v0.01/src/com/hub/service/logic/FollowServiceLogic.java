package com.hub.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Follow;
import com.hub.service.pacade.FollowService;
import com.hub.store.pacade.FollowStore;

@Service
public class FollowServiceLogic implements FollowService {

	@Autowired
	private FollowStore followStore;
	
	@Override
	public int registerFollow(Follow follow) {
		return followStore.insertFollow(follow);
	}

	@Override
	public int removeFollow(Follow follow) {
		return followStore.deleteFollow(follow);
	}

	@Override
	public int confirmFollow(Follow follow) {
		return followStore.updateFollowConfirm(follow);
	}
	
	@Override
	public List<Follow> findAll(String userId) {
		return followStore.selectAll(userId);
	}

	@Override
	public List<Follow> findRequestedFollows(String userId) {
		return followStore.selectRequestedFollows(userId);
	}
	
	@Override
	public List<Follow> findFollowsByConnChain(String userId, String connChain) {
		return followStore.selectFollowsByConnChain(userId, connChain);
	}

	@Override
	public List<Follow> findFollowsByRelation(Follow follow) {
		return followStore.selectFollowsByRelation(follow);
	}

	@Override
	public boolean checkRequest(String userId, String followId){
		for(Follow Follow : followStore.selectRequestedFollows(userId)){
			if(Follow.getFollowId().equals(followId)){
				return false;
			}
		}
		for(Follow Follow : followStore.selectAll(userId)){
			if(Follow.getFollowId().equals(followId)){
				return false;
			}
		}
		
		return true;
	}

}
