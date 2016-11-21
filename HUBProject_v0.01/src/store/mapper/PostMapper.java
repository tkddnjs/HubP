package store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.Post;

public interface PostMapper {
	
	int insertPost(Post post);
	int deletePost(int postId);
	List<Post> selectAll(String userId);
	List<Post> selectPostsByFriendId(@Param("userId")String userId, @Param("friendId")String friendId);
	List<Post> selectSendPosts(String userId);
	List<Post> selectReceivePosts(String userId);
}
