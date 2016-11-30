package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Post;

public interface PostService {

	int sendPost(Post post);
	int removePost(int postId);
	List<Post> findAll(String userId);
	List<Post> findPosts(String userId, String followId);
	List<Post> findSendPosts(String userId);
	List<Post> findReceivePosts(String userId);
}
