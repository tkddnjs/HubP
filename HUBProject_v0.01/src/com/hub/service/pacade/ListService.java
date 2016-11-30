package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Bucketlist;
import com.hub.domain.User;

public interface ListService {

	List<User> findUsersByConnChain(String connChain);
	List<Bucketlist> findBucketlistsByConnChain(String connChain);
	List<String> findConnChains();
	List<String> findConnChainsByUserId(String userId);
}
