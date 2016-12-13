package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Bucketlist;

public interface BucketlistMapper {
	
	// 버킷리스트 등록
	int nextBucketlistId();
	int insertBucketlistConn(@Param("bucketId")int bucketlistId,@Param("connChain")String connChain);	
	int insertBucketlist(Bucketlist bucketlist);

	// 버킷리스트 수정
	int updateBucketlist(Bucketlist bucketlist);

	// 버킷리스트 삭제
	int deleteBucketlist(int bucketlistId);
	int deleteBucketlistConn(int bucketlistId);
	
	// 버킷리스트 조회
	List<Bucketlist> selectAll(String userId);
	Bucketlist selectBucketlistByBucketlistId(int bucketlistId);
	List<Bucketlist> selectBucketlistsByConnChain(String connChain);
	
	List<Bucketlist> selectBucketlistsByConnChains(List<String> connChains);
	
	// 버킷리스트 domain의 connChains를 set 
	List<String> selectConnChainsByBucketlistId(int bucketlistId);
}
