package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.Follow;

public interface FollowStore {
	
	// 팔로우 추가 (팔로우 요청)
	int insertFollow(Follow follow);
	
	// 팔로우 수정 (팔로우 요청 수락)
	int updateFollow(Follow follow);
	
	// 팔로우 삭제 (팔로우 요청 거절 / 팔로우 삭제)
	int deleteFollow(Follow follow);
	
	Follow selectFollowById(String userId, String followId);
	
	// 팔로우 조회
	List<Follow> selectAll(String userId);
	List<Follow> selectFollowsRequested(String userId);
	List<Follow> selectConnectedFollows(String userId);

}
