package service.pacade;

import java.util.List;

import domain.Post;

public interface PostService {

	int sendPost(Post post);
	int removePost(int postId);
	List<Post> findAll(String userId);
	List<Post> findPosts(String userId, String toUserId);
	List<Post> findPostsByTransmit(String userId, String transmit);
}
