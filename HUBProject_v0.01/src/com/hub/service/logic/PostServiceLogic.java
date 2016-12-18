package com.hub.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Post;
import com.hub.service.pacade.PostService;
import com.hub.store.pacade.PostStore;

@Service
public class PostServiceLogic implements PostService {

	@Autowired
	private PostStore postStore;
	
	@Override
	public int sendPost(Post post) {
		return postStore.insertPost(post);
	}

	@Override
	public int removePost(int postId) {
		return postStore.deletePost(postId);
	}

	@Override
	public List<Post> findAll(String userId) {
		return postStore.selectAll(userId);
	}

	@Override
	public Post findPostByPostId(int postId) {
		return postStore.selectPostByPostId(postId);
	}

	@Override
	public List<Post> findPosts(String userId, String followId) {
		return postStore.selectPosts(userId, followId);
	}

//	@Override
//	public List<Post> findSendPosts(String userId) {
//		return postStore.selectSendPosts(userId);
//	}
//
//	@Override
//	public List<Post> findReceivePosts(String userId) {
//		return postStore.selectReceivePosts(userId);
//	}


}
