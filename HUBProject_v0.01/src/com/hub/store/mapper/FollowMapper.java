package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Follow;

public interface FollowMapper {
	
	int insertFollow(Follow follow);
	int deleteFollow(Follow follow);
	
	// 추가
	int updateFollowConfirm(Follow follow);
	List<Follow> selectRequestedFollows(String userId);
	//
	
	List<Follow> selectAll(String userId);
	List<Follow> selectFollowsByConnChain(@Param("userId")String userId, @Param("connChain")String connChain);
	List<Follow> selectFollowsByRelation(Follow follow);
}
