package service.logic;

import java.util.List;

import domain.Bucketlist;
import domain.Cooper;
import domain.User;
import service.pacade.ListService;
import store.logic.BucketlistStoreLogic;
import store.logic.ConnChainStoreLogic;
import store.logic.CooperStoreLogic;
import store.logic.UserStoreLogic;
import store.pacade.BucketlistStore;
import store.pacade.ConnChainStore;
import store.pacade.CooperStore;
import store.pacade.UserStore;

public class ListServiceLogic implements ListService {

	private UserStore uStore;
	private BucketlistStore bStore;
	private CooperStore cStore;
	private ConnChainStore ccStore;
	
	public ListServiceLogic() {
		uStore = new UserStoreLogic();
		bStore = new BucketlistStoreLogic();
		cStore = new CooperStoreLogic();
		ccStore = new ConnChainStoreLogic();
	}
	
	@Override
	public List<User> findUsersByConnChains(List<String> connChains) {
		return uStore.selectUsersByConnChains(connChains);
	}
	@Override
	public List<Bucketlist> findBucketlistsByConnChains(List<String> connChains) {
		return bStore.selectBucketlistsByConnChains(connChains);
	}

	@Override
	public List<Cooper> findCoopersByConnChains(List<String> connChains) {
		return cStore.selectCoopersByConnChains(connChains);
	}

	@Override
	public List<String> findConnChainsByUserId(String userId){
		return uStore.selectUser(userId).getConnChains();
	}
	
	public List<String> findConnChains(){
		return ccStore.selectConnChains();
	}
	
}
