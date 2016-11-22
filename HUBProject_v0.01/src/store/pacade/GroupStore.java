package store.pacade;

import java.util.List;

import domain.Group;

public interface GroupStore {

	int insertGroup(Group group);
	int updateGroup(Group group);
	int deleteGroup(int groupId);
	int insertUserGroup(int groupId, String userId);
	int deleteUserGroup(int groupId, String userId);
	List<Group> selectAll();
	Group selectGroupByGroupId(int groupId);
	List<Group> selectGroupsByUserId(String userId);
	List<Group> selectGroupsByConnChain(String ConnChain);
	List<Group> selectGroupsByGroupName(String groupName);
	List<Group> selectGroupsByLocal(String local);
}
