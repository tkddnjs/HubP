package store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import domain.Group;

public interface GroupMapper {
	
	int insertGroup(Group group);
	int updateGroup(Group group);
	int deleteGroup(int groupId);
	int insertUserGroup(@Param("groupId")int groupId, @Param("userId")String userId);
	int deleteUserGroup(@Param("groupId")int groupId, @Param("userId")String userId);
	List<Group> selectAll();
	Group selectGroupByGroupId(int groupId);
	List<Group> selectGroupsByUserId(String userId);
	List<Group> selectGroupsByConnChain(String ConnChain);
	List<Group> selectGroupsByGroupName(String groupName);
	List<Group> selectGroupsByLocal(String local);
	
}
