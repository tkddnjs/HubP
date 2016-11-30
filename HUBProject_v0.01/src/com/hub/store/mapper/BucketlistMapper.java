package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Bucketlist;

public interface BucketlistMapper {
	
	int nextBucketlistId();
	int insertBucketlistConn(@Param("bucketId")int bucketlistId,@Param("connChain")String connChain);	
	int insertBucketlist(Bucketlist bucketlist);
	int updateBucketlist(Bucketlist bucketlist);
	//
	int deleteBucketlistConn(int bucketlistId);
	//
	int deleteBucketlist(int bucketlistId);
	List<Bucketlist> selectAll(String userId);
	Bucketlist selectBucketlistByBucketlistId(int bucketlistId);
	List<Bucketlist> selectBucketlistsByConnChain(String connChain);
	
	List<String> selectConnChainsByBucketlistId(int bucketlistId);
}
