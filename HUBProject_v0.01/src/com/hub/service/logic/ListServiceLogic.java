package com.hub.service.logic;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Bucketlist;
import com.hub.domain.User;
import com.hub.service.pacade.ListService;
import com.hub.store.pacade.BucketlistStore;
import com.hub.store.pacade.ConnChainStore;
import com.hub.store.pacade.UserStore;

@Service
public class ListServiceLogic implements ListService {

	@Autowired
	private UserStore userStore;
	@Autowired
	private BucketlistStore bucketlistStore;
	@Autowired
	private ConnChainStore connChainStore;
	
//	@Override
//	public List<User> findUsersByConnChain(String connChain) {
//		return userStore.selectUsersByConnChain(connChain);
//	}
//	@Override
//	public List<Bucketlist> findBucketlistsByConnChain(String connChain) {
//		return bucketlistStore.selectBucketlistsByConnChain(connChain);
//	}
	
	@Override
	public List<String> findConnChains(){
		return connChainStore.selectConnChains();
	}

	@Override
	public List<String> findConnChainsByUserId(String userId){
		return userStore.selectUser(userId).getConnChains();
	}
	
	@Override
	public List<String> findBucketlistConnChainsByUserId(String userId){
		Set<String> conns = new HashSet<>();
		List<String> connChains = new ArrayList<>();
		
		for(Bucketlist bucketlist :  bucketlistStore.selectAll(userId)){
			conns.addAll(bucketlist.getConnChains());
		}
		
		for(String conn : conns){
			connChains.add(conn);
		}
		
		return connChains;
	}
	
	@Override
	public List<Bucketlist> findBucketlistsByConnChains(String userId) {
		List<Bucketlist> bucketlists = new ArrayList<>();
		for(Bucketlist bucketlist : bucketlistStore.selectBucketlistsByConnChains(findConnChainsByUserId(userId))){
			if(!bucketlist.getUserId().equals(userId)){
				bucketlists.add(bucketlist);
			}
		}
		return bucketlists;
	}
	
	@Override
	public List<User> findUsersByConnChains(String userId) {
		List<User> users = new ArrayList<>();
		for(User user : userStore.selectUsersByConnChains(findBucketlistConnChainsByUserId(userId))){
			if(!user.getUserId().equals(userId)){
				users.add(user);
			}
		}
		return users;
	}
	
	@Override
	public List<Bucketlist> findBothLists(String userId){
		List<Bucketlist> bucketlists = new ArrayList<>();
		
		List<User> users = findUsersByConnChains(userId);
		
		for(Bucketlist bucketlist : findBucketlistsByConnChains(userId)){
			for(User user : users){
				if(user.getUserId().equals(bucketlist.getUserId()))
					bucketlists.add(bucketlist);
			}
		}
		return bucketlists;
	}

}
