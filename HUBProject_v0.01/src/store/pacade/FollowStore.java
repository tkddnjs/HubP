package store.pacade;

import java.util.List;

import domain.Follow;

public interface FollowStore {
	
	int insertFollow(Follow follow);
	int deleteFollow(Follow follow);
	
	//추가
	int updateFollowConfirm(Follow follow);
	List<Follow> selectRequestedFollows(String userId);
	//
	
	List<Follow> selectAll(String userId);
	List<Follow> selectFollowsByConnChain(String userId, String connChain);
	List<Follow> selectFollowsByRelation(Follow follow);
}
