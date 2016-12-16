package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Follow;

public interface FollowMapper {
	
	int insertFollow(Follow follow);
	int updateFollow(Follow follow);
	int deleteFollow(Follow follow);
	Follow selectFollowById(@Param("userId")String userId, @Param("followId")String followId);
	List<Follow> selectAll(String userId);
	List<Follow> selectFollowsRequested(String userId);
	List<Follow> selectConnectedFollows(String userId);
}
