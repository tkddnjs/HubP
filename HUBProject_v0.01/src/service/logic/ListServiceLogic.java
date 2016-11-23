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
	public List<User> findUsersByConnChain(String connChain) {
		return userStore.selectUsersByConnChain(connChain);
	}
	@Override
	public List<Bucketlist> findBucketlistsByConnChain(String connChain) {
		return bucketlistStore.selectBucketlistsByConnChain(connChain);
	}

	@Override
	public List<Cooper> findCoopersByConnChain(String connChain) {
		return cooperStore.selectCoopersByConnChain(connChain);
	}

	@Override
	public List<String> findConnChainsByUserId(String userId){
		return userStore.selectUser(userId).getConnChains();
	}
	
	public List<String> findConnChains(){
		return connChainStore.selectConnChains();
	}
	
}
