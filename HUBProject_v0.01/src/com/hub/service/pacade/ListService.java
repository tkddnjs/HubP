package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Bucketlist;
import com.hub.domain.Cooper;
import com.hub.domain.User;

public interface ListService {

	List<User> findUsersByConnChain(String connChain);
	List<Bucketlist> findBucketlistsByConnChain(String connChain);
	List<Cooper> findCoopersByConnChain(String connChain);
	List<String> findConnChainsByUserId(String userId);
	List<String> findConnChains();
}
