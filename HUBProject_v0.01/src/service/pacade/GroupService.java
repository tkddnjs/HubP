package service.pacade;

import java.util.List;

import domain.Group;

public interface GroupService {
	
	int registerGroup(Group group);
	int modifyGroup(Group group);
	int removeGroup(int groupId);
	int joinGroup(int groupId, String userId);
	int exitGroup(int groupId, String userId);
	List<Group> findAll();
	Group findGroupByGroupId(int groupId);
	List<Group> findGroupsByUserId(String userId);
	List<Group> findGroupsByConnChains(List<String> connChain);
	List<Group> findGroupsByGroupName(String groupName);
	List<Group> findGroupsByLocal(String local);
}
