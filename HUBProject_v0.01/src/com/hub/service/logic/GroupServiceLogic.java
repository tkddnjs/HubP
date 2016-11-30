package com.hub.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Group;
import com.hub.service.pacade.GroupService;
import com.hub.store.pacade.ConnChainStore;
import com.hub.store.pacade.GroupStore;

@Service
public class GroupServiceLogic implements GroupService {

	@Autowired
	private GroupStore groupStore;
	@Autowired
	private ConnChainStore connChainStore;
	
	@Override
	public int registerGroup(Group group) {
		int result = 1;
		
		result *= groupStore.insertGroup(group);
		result *= groupStore.insertGroupConn(group);
		
		List<String> sList = new ArrayList<>();
		for(String connChain : group.getConnChains()){
			if(!connChainStore.selectConnChains().contains(connChain)){
				sList.add(connChain);
			}
		}
		for(String connChain : sList){
			result *= connChainStore.insertConnChain(connChain);
		}
		
		return result;
	}

	@Override
	public int modifyGroup(Group group) {
		return groupStore.updateGroup(group);
	}

	@Override
	public int removeGroup(int groupId) {
		int result = 1;
		result *= groupStore.deleteGroup(groupId);
		result *= groupStore.deleteGroupConn(groupId);
		return result;
	}

	@Override
	public int joinGroup(int groupId, String userId) {
		return groupStore.insertUserGroup(groupId, userId);
	}

	@Override
	public int exitGroup(int groupId, String userId) {
		return groupStore.deleteUserGroup(groupId, userId);
	}

	@Override
	public List<Group> findAll() {
		return groupStore.selectAll();
	}

	@Override
	public Group findGroupByGroupId(int groupId) {
		return groupStore.selectGroupByGroupId(groupId);
	}

	@Override
	public List<Group> findGroupsByUserId(String userId) {
		return groupStore.selectGroupsByUserId(userId);
	}

	@Override
	public List<Group> findGroupsByConnChain(String connChain) {
		return groupStore.selectGroupsByConnChain(connChain);
	}

	@Override
	public List<Group> findGroupsByGroupName(String groupName) {
		return groupStore.selectGroupsByGroupName(groupName);
	}

	@Override
	public List<Group> findGroupsByLocal(String local) {
		return groupStore.selectGroupsByLocal(local);
	}

}
