package service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Post;
import service.pacade.PostService;
import store.pacade.PostStore;

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
	public List<Post> findPosts(String userId, String toUserId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> findPostsByTransmit(String userId, String transmit) {
		// TODO Auto-generated method stub
		return null;
	}

}
