package service.logic;

import java.util.List;

import org.springframework.stereotype.Service;

import domain.Follow;
import service.pacade.FollowService;
import store.logic.FollowStoreLogic;
import store.pacade.FollowStore;

@Service
public class FollowServiceLogic implements FollowService {

	private FollowStore store;
	
	public FollowServiceLogic() {
		store = new FollowStoreLogic();
	}
	
	@Override
	public int registerFollow(Follow follow) {
		return store.insertFollow(follow);
	}

	@Override
	public int removeFollow(Follow follow) {
		return store.deleteFollow(follow);
	}

	@Override
	public int confirmFollow(Follow follow) {
		return store.updateFollowConfirm(follow);
	}
	
	@Override
	public List<Follow> findAll(String userId) {
		return store.selectAll(userId);
	}

	@Override
	public List<Follow> findRequestedFollows(String userId) {
		return store.selectRequestedFollows(userId);
	}
	
	@Override
	public List<Follow> findFollowsByConnChain(String userId, String connChain) {
		return store.selectFollowsByConnChain(userId, connChain);
	}

	@Override
	public List<Follow> findFollowsByRelation(Follow follow) {
		return store.selectFollowsByRelation(follow);
	}

	@Override
	public boolean checkRequest(String userId, String followId){
		for(Follow Follow : store.selectRequestedFollows(userId)){
			if(Follow.getFollowId().equals(followId)){
				return false;
			}
		}
		for(Follow Follow : store.selectAll(userId)){
			if(Follow.getFollowId().equals(followId)){
				return false;
			}
		}
		
		return true;
	}

}
