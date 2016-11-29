package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.Bucketlist;

public interface BucketlistStore {
	
	int nextBucketlistId();
	int insertBucketlistConn(Bucketlist bucketlist);
	int insertBucketlist(Bucketlist bucketlist);
	int updateBucketlist(Bucketlist bucketlist);
	//
	int deleteBucketlistConn(int bucketlistId);
	//
	int deleteBucketlist(int bucketlistId);
	List<Bucketlist> selectAll(String userId);
	Bucketlist selectBucketlistByBucketlistId(int bucketlistId);
	
	List<Bucketlist> selectBucketlistsByConnChain(String connChain);
}
