package com.hub.service.logic;

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
		return groupStore.insertGroup(group);
	}

	@Override
	public int modifyGroup(Group group) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeGroup(int groupId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int joinGroup(int groupId, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int exitGroup(int groupId, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Group> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Group findGroupByGroupId(int groupId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> findGroupsByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> findGroupsByConnChains(List<String> connChain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> findGroupsByGroupName(String groupName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> findGroupsByLocal(String local) {
		// TODO Auto-generated method stub
		return null;
	}

}
