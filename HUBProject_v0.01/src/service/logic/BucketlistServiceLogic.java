package service.logic;

import java.util.List;

import org.springframework.stereotype.Service;

import domain.Bucketlist;
import service.pacade.BucketlistService;
import store.logic.BucketlistStoreLogic;
import store.logic.ConnChainStoreLogic;
import store.pacade.BucketlistStore;
import store.pacade.ConnChainStore;

@Service
public class BucketlistServiceLogic implements BucketlistService {

	private BucketlistStore store;
	private ConnChainStore ccStore;
	
	public BucketlistServiceLogic() {
		store = new BucketlistStoreLogic();
		ccStore = new ConnChainStoreLogic();
	}
	
	@Override
	public int registerBucketlist(Bucketlist bucketlist) {
		int result = 1;
		
		bucketlist.setBucketlistId(store.nextBucketlistId());
		
		result *= store.insertBucketlist(bucketlist);
		result *= store.insertBucketlistConn(bucketlist);
		
		List<String> sList = bucketlist.getConnChains();
		for(String connChain : sList){
			for(String str : ccStore.selectConnChains()){
				if(connChain.equals(str)){
					sList.remove(connChain);
					break;
				}
			}
		}
		
		for(String connChain : sList){
			result *= ccStore.insertConnChain(connChain);
		}
		
		
		return result;
	}

	@Override
	public int modifyBucketlist(Bucketlist bucketlist) {
		return store.updateBucketlist(bucketlist);
	}

	@Override
	public int removeBucketlist(int bucketlistId) {
		return store.deleteBucketlist(bucketlistId);
	}

	@Override
	public Bucketlist findBucketlistByBucketlistId(int bucketlistId) {
		return store.selectBucketlistByBucketlistId(bucketlistId);
	}

	@Override
	public List<Bucketlist> findAll(String userId) {
		return store.selectAll(userId);
	}

}
