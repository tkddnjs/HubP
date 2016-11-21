package store.pacade;

import java.util.List;

import domain.Bucketlist;

public interface BucketlistStore {
	
	int nextBucketlistId();
	int insertBucketlistConn(Bucketlist bucketlist);
	
	int insertBucketlist(Bucketlist bucketlist);
	int updateBucketlist(Bucketlist bucketlist);
	int deleteBucketlist(int bucketlistId);
	List<Bucketlist> selectAll(String userId);
	Bucketlist selectBucketlistByBucketlistId(int bucketlistId);
	
	List<Bucketlist> selectBucketlistsByConnChains(List<String> connChains);
}
