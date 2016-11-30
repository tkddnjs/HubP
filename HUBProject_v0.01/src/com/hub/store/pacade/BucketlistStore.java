package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.Bucketlist;

public interface BucketlistStore {
	
	// 버킷리스트 등록
	int nextBucketlistId();
	int insertBucketlist(Bucketlist bucketlist);
	int insertBucketlistConn(Bucketlist bucketlist);
	
	// 버킷리스트 수정
	int updateBucketlist(Bucketlist bucketlist);
	
	// 버킷리스트 삭제
	int deleteBucketlist(int bucketlistId);
	int deleteBucketlistConn(int bucketlistId);
	
	// 버킷리스트 조회
	List<Bucketlist> selectAll(String userId);
	Bucketlist selectBucketlistByBucketlistId(int bucketlistId);
	List<Bucketlist> selectBucketlistsByConnChain(String connChain);
}
