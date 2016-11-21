package service.pacade;

import java.util.List;

import domain.Bucketlist;
import domain.Cooper;
import domain.User;

public interface ListService {

	List<User> findUsersByConnChains(List<String> connChains);
	List<Bucketlist> findBucketlistsByConnChains(List<String> connChains);
	List<Cooper> findCoopersByConnChains(List<String> connChains);
	List<String> findConnChainsByUserId(String userId);
	List<String> findConnChains();
}
