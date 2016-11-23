package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Bucketlist;

public interface BucketlistService {
	
	int registerBucketlist(Bucketlist bucketlist);
	int modifyBucketlist(Bucketlist bucketlist);
	int removeBucketlist(int bucketlistId);
	Bucketlist findBucketlistByBucketlistId(int bucketlistId);
	List<Bucketlist> findAll(String userId);
}
