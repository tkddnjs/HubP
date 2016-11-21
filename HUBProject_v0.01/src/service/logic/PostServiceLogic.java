package service.logic;

import java.util.List;

import domain.Post;
import service.pacade.PostService;
import store.logic.PostStoreLogic;
import store.pacade.PostStore;

public class PostServiceLogic implements PostService {

	private PostStore store;
	
	public PostServiceLogic(){
		store = new PostStoreLogic();
	}
	
	@Override
	public int sendPost(Post post) {
		return store.insertPost(post);
	}

	@Override
	public int removePost(int postId) {
		return store.deletePost(postId);
	}

	@Override
	public List<Post> findAll(String userId) {
		return store.selectAll(userId);
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
