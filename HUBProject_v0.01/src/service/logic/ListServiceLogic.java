package service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Bucketlist;
import domain.Cooper;
import domain.User;
import service.pacade.ListService;
import store.pacade.BucketlistStore;
import store.pacade.ConnChainStore;
import store.pacade.CooperStore;
import store.pacade.UserStore;

@Service
public class ListServiceLogic implements ListService {

	@Autowired
	private UserStore userStore;
	@Autowired
	private BucketlistStore bucketlistStore;
	@Autowired
	private CooperStore cooperStore;
	@Autowired
	private ConnChainStore connChainStore;
	
	@Override
	public List<User> findUsersByConnChains(List<String> connChains) {
		return userStore.selectUsersByConnChains(connChains);
	}
	@Override
	public List<Bucketlist> findBucketlistsByConnChains(List<String> connChains) {
		return bucketlistStore.selectBucketlistsByConnChains(connChains);
	}

	@Override
	public List<Cooper> findCoopersByConnChains(List<String> connChains) {
		return cooperStore.selectCoopersByConnChains(connChains);
	}

	@Override
	public List<String> findConnChainsByUserId(String userId){
		return userStore.selectUser(userId).getConnChains();
	}
	
	public List<String> findConnChains(){
		return connChainStore.selectConnChains();
	}
	
}
