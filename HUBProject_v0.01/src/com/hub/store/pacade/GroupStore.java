package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.Group;

public interface GroupStore {

	// 모임방 개설
	int nextGroupId();
	int insertGroup(Group group);
	int insertGroupConn(Group group);
	
	// 모임방 참여
	int insertUserGroup(int groupId, String userId);
	
	// 모임방 수정
	int updateGroup(Group group);
	
	// 모임방 삭제
	int deleteGroup(int groupId);
	int deleteGroupConn(int groupId);
	
	// 모임방 탈퇴
	int deleteUserGroup(int groupId, String userId);
	
	// 모임방 조회
	List<Group> selectAll(String userId);
	Group selectGroupByGroupId(int groupId);
	List<Group> selectGroupsByUserId(String userId);
	List<String> selectJoinUsersByGroupId(int groupId);
	
	/* 삭제
	List<Group> selectGroupsByConnChain(String connChain);
	List<Group> selectGroupsByGroupName(String groupName);
	List<Group> selectGroupsByLocal(String local);
	*/
	
	//groupConnChain
	List<String>selectConnChainByGroupId(int groupId);
}
