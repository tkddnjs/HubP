package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Post;

public interface PostMapper {
	
	int insertPost(Post post);
	int deletePost(int postId);
	List<Post> selectAll(String userId);
	List<Post> selectPosts(@Param("userId")String userId, @Param("followId")String followId);
	List<Post> selectSendPosts(String userId);
	List<Post> selectReceivePosts(String userId);
}
