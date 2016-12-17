package com.hub.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Follow;
import com.hub.domain.Group;
import com.hub.service.pacade.GroupService;
import com.hub.store.pacade.ConnChainStore;
import com.hub.store.pacade.FollowStore;
import com.hub.store.pacade.GroupStore;

@Service
public class GroupServiceLogic implements GroupService {

	@Autowired
	private GroupStore groupStore;
	@Autowired
	private ConnChainStore connChainStore;
	//모임방 개설자에게 팔로우 요청을 위함
	@Autowired
	private FollowStore followStore;
	
	@Override
	public int registerGroup(Group group) {
		int result = 1;
		
		group.setGroupId(groupStore.nextGroupId());
		
		result *= groupStore.insertGroup(group);
		result *= groupStore.insertUserGroup(group.getGroupId(), group.getManagerId());
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
		
		int result = 0;
		List<String> checkGroupConnChains = groupStore.selectConnChainByGroupId(group.getGroupId());
		
		for(String resultCheckGroupConnChains : checkGroupConnChains){
			if(resultCheckGroupConnChains.equals(group.getConnChains())){
				group.setConnChains(null);
				result = groupStore.updateGroup(group);
				return result;
			}else{
				result = groupStore.updateGroup(group);
				
			    return result;
			}
		}
		
		return result;
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
		
		int result = 0;
		
		//userGroup_tb참여등록
		result = groupStore.insertUserGroup(groupId, userId);	
		
		//모임방 개설자(managerId) 가져오기
		Group searchManagerId = groupStore.selectGroupByGroupId(groupId);
		
		if(searchManagerId != null){
			//follow 요청하기
			Follow follow = new Follow();
			follow.setFollowId(searchManagerId.getManagerId());
			follow.setUserId(userId);
			follow.setConfirm(true);
			follow.setRelation(4); //follow와의 관계 (1: 내가 , 2:너를, 3:서로, 4:모임)
			followStore.insertFollow(follow);			
		}
		
		return result;
	}

	@Override
	public int exitGroup(int groupId, String userId) {
		
		int result =0;
		
		//userGroup_tb 참여탈퇴
		result = groupStore.deleteUserGroup(groupId, userId);
		
		//모임방 개설자(managerId) 가져오기
		Group searchManagerId = groupStore.selectGroupByGroupId(groupId);
		
		//follow요청 취소
		Follow follow = followStore.selectFollowById(userId, searchManagerId.getManagerId());
		System.out.println(follow.getRelation());
		if(follow.getRelation()==4){
			followStore.deleteFollow(follow);
		}
		/*
		if(searchManagerId != null){
			
		}*/
		
		return result;
	}

	@Override
	public List<Group> findAll(String userId) {
		return groupStore.selectAll(userId);
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
	public List<String> findJoinUsersByGroupId(int groupId) {
		return groupStore.selectJoinUsersByGroupId(groupId);
	}

}
