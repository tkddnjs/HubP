package service.pacade;

import java.util.List;

import domain.Bucketlist;
import domain.Cooper;
import domain.User;

public interface ListService {

	List<User> findUsersByConnChain(String connChain);
	List<Bucketlist> findBucketlistsByConnChain(String connChain);
	List<Cooper> findCoopersByConnChain(String connChain);
	List<String> findConnChainsByUserId(String userId);
	List<String> findConnChains();
}
