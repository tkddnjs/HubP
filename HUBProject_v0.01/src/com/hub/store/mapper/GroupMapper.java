package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.Group;

public interface GroupMapper {
	
	int nextGroupId();
	int insertGroup(Group group);
	int insertGroupConn(@Param("groupId")int groupId, @Param("connChain")String connChain);
	int insertUserGroup(@Param("groupId")int groupId, @Param("userId")String userId);
	int updateGroup(Group group);
	int deleteGroup(int groupId);
	int deleteGroupConn(int groupId);
	int deleteUserGroup(@Param("groupId")int groupId, @Param("userId")String userId);
	List<Group> selectAll();
	Group selectGroupByGroupId(int groupId);
	List<Group> selectGroupsByUserId(String userId);
	List<Group> selectGroupsByConnChain(String connChain);
	List<Group> selectGroupsByGroupName(String groupName);
	List<Group> selectGroupsByLocal(String local);
	
	List<String> selectConnChainsByGroupId(int groupId);
	List<String> selectJoinUsersByGroupId(int groupId);
}
