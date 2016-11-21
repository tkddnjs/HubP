package store.pacade;

import java.util.List;

import domain.Post;

public interface PostStore {
	
	int insertPost(Post post);
	int deletePost(int postId);
	List<Post> selectAll(String userId);
	List<Post> selectPosts(String userId, String friendId);
	List<Post> selectSendPosts(String userId);
	List<Post> selectReceivePosts(String userId);
}
