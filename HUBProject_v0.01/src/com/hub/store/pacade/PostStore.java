package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.Post;

public interface PostStore {
	
	// 쪽지 등록
	int insertPost(Post post);
	
	// 쪽지 삭제
	int deletePost(int postId);
	
	// 쪽지 조회
	List<Post> selectAll(String userId);
	List<Post> selectPosts(String userId, String followId);
	List<Post> selectSendPosts(String userId);
	List<Post> selectReceivePosts(String userId);
}
