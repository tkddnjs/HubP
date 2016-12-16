package com.hub.store.logic;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.domain.Group;
import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.GroupMapper;
import com.hub.store.pacade.GroupStore;

@Repository
public class GroupStoreLogic implements GroupStore {

	private SqlSessionFactory factory;

	public GroupStoreLogic(){
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int nextGroupId() {
		SqlSession session = factory.openSession();
		int nextGroupId = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			nextGroupId = mapper.nextGroupId();
			
		} finally{
			session.close();
		}
		return nextGroupId;
	}

	@Override
	public int insertGroup(Group group) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			result = mapper.insertGroup(group);
			if(result > 0 ){
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int insertGroupConn(Group group) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			
			for(String connChain : group.getConnChains()){
				result = mapper.insertGroupConn(group.getGroupId(), connChain);
			}	
			
			if(result > 0 ){
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int insertUserGroup(int groupId, String userId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			result = mapper.insertUserGroup(groupId, userId);
			if(result > 0 ){
				session.commit();	
				
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int updateGroup(Group group) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			result = mapper.updateGroup(group);
			if(result > 0 ){
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int deleteGroup(int groupId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			result = mapper.deleteGroup(groupId);
			if(result > 0 ){
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int deleteGroupConn(int groupId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			result = mapper.deleteGroupConn(groupId);
			if(result > 0 ){
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int deleteUserGroup(int groupId, String userId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			result = mapper.deleteUserGroup(groupId, userId);
			if(result > 0 ){
				session.commit();
			} else {
				session.rollback();
			}
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public List<Group> selectAll(String userId) {
		SqlSession session = factory.openSession();
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			return mapper.selectAll(userId);
		} finally {
			session.close();
		}
	}

	@Override
	public Group selectGroupByGroupId(int groupId) {
		SqlSession session = factory.openSession();
		
		//Group group = new Group();
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			return mapper.selectGroupByGroupId(groupId);
			
//			if(group != null){
//				group.setTotalJoinPeople(mapper.joinMemberCounting(groupId));
//				
//				return group;
//			}
		} finally {
			session.close();
		}
		
		//return group;
	}

	@Override
	public List<Group> selectGroupsByUserId(String userId) {
		SqlSession session = factory.openSession();
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			return mapper.selectGroupsByUserId(userId);
		} finally {
			session.close();
		}
	}



	/*
	@Override
	public List<Group> selectGroupsByConnChain(String connChain) {
		SqlSession session = factory.openSession();
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			return mapper.selectGroupsByConnChain(connChain);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Group> selectGroupsByGroupName(String groupName) {
		SqlSession session = factory.openSession();
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			return mapper.selectGroupsByGroupName(groupName);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Group> selectGroupsByLocal(String local) {
		SqlSession session = factory.openSession();
		try {
			GroupMapper mapper = session.getMapper(GroupMapper.class);
			return mapper.selectGroupsByLocal(local);
		} finally {
			session.close();
		}
	}
	*/

	@Override
	public List<String> selectConnChainByGroupId(int groupId) {
		SqlSession session = factory.openSession();
		List<String> list = new ArrayList<>();
		
		GroupMapper mapper = session.getMapper(GroupMapper.class);
		list = mapper.selectConnChainsByGroupId(groupId);
		
		if(list != null){
			session.close();
			
			return list;
		}
		
		return null;
	}

	@Override
	public List<String> selectJoinUsersByGroupId(int groupId) {
		SqlSession session = factory.openSession();
		List<String> list = new ArrayList<>();
		
		GroupMapper mapper = session.getMapper(GroupMapper.class);
		list = mapper.selectJoinUsersByGroupId(groupId);
		
		if(list != null){
			session.close();
			return list;
		}
		return null;
	}
	
	

}
