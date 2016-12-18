package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Bucketlist;
import com.hub.domain.User;

public interface ListService {

//	List<User> findUsersByConnChain(String connChain);
	List<User> findUsersByConnChains(String userId);
	
//	List<Bucketlist> findBucketlistsByConnChain(String connChain);
	List<Bucketlist> findBucketlistsByConnChains(String userId);
	
	List<String> findConnChains();
	List<String> findConnChainsByUserId(String userId);
	List<String> findBucketlistConnChainsByUserId(String userId);
	List<Bucketlist> findBothLists(String userId);
}
