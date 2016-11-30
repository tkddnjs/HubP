package com.hub.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Bucketlist;
import com.hub.service.pacade.BucketlistService;
import com.hub.store.pacade.BucketlistStore;
import com.hub.store.pacade.ConnChainStore;

@Service
public class BucketlistServiceLogic implements BucketlistService {

	@Autowired
	private BucketlistStore bucketlistStore;
	@Autowired
	private ConnChainStore connChainStore;
	
	@Override
	public int registerBucketlist(Bucketlist bucketlist) {
		int result = 1;
		
		bucketlist.setBucketlistId(bucketlistStore.nextBucketlistId());
		
		result *= bucketlistStore.insertBucketlist(bucketlist);
		result *= bucketlistStore.insertBucketlistConn(bucketlist);
		
		List<String> sList = bucketlist.getConnChains();
		sList.removeAll(connChainStore.selectConnChains());
		
		for(String connChain : sList){
			result *= connChainStore.insertConnChain(connChain);
		}
		
		return result;
	}

	@Override
	public int modifyBucketlist(Bucketlist bucketlist) {
		int result = 1;
		
		result *= bucketlistStore.updateBucketlist(bucketlist);
		result *= bucketlistStore.deleteBucketlistConn(bucketlist.getBucketlistId());
		result *= bucketlistStore.insertBucketlistConn(bucketlist);

		return result;
	}

	@Override
	public int removeBucketlist(int bucketlistId) {
		return bucketlistStore.deleteBucketlist(bucketlistId);
	}
	
	@Override
	public List<Bucketlist> findAll(String userId) {
		return bucketlistStore.selectAll(userId);
	}

	@Override
	public Bucketlist findBucketlistByBucketlistId(int bucketlistId) {
		return bucketlistStore.selectBucketlistByBucketlistId(bucketlistId);
	}
}
