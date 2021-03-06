package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Group;

public interface GroupService {
	
	int registerGroup(Group group);
	int joinGroup(int groupId, String userId);
	int modifyGroup(Group group);
	int removeGroup(int groupId);
	int exitGroup(int groupId, String userId);
	List<Group> findAll();
	Group findGroupByGroupId(int groupId);
	List<Group> findGroupsByUserId(String userId);
	List<Group> findGroupsByConnChain(String connChain);
	List<Group> findGroupsByGroupName(String groupName);
	List<Group> findGroupsByLocal(String local);
}
