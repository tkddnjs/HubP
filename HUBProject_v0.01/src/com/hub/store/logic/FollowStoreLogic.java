package com.hub.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.domain.Follow;
import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.FollowMapper;
import com.hub.store.pacade.FollowStore;

@Repository
public class FollowStoreLogic implements FollowStore {

	private SqlSessionFactory factory;

	public FollowStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insertFollow(Follow follow) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		Follow temp = new Follow();
		temp.setFollowId(follow.getUserId());
		temp.setUserId(follow.getFollowId());
		if(follow.getRelation() != 4){
			temp.setRelation((3-follow.getRelation()));
		}else {
			temp.setRelation(4);
		}
		temp.setConfirm(false);
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			result = mapper.insertFollow(follow);
			result *= mapper.insertFollow(temp);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		}catch (Exception e) {
			return 4;
		} 
		finally {
			session.close();
		}
		
		return result;
	}

	@Override
	public int updateFollow(Follow follow) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			result = mapper.updateFollow(follow);
			if (result > 0) {
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
	public int deleteFollow(Follow follow) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			result = mapper.deleteFollow(follow);
			if (result > 0) {
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
	public List<Follow> selectAll(String userId) {
		SqlSession session = factory.openSession();

		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			return mapper.selectAll(userId);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Follow> selectFollowsRequested(String userId) {
		SqlSession session = factory.openSession();
		
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			return mapper.selectFollowsRequested(userId);
		} finally {
			session.close();
		}
	}
	
	@Override
	public List<Follow> selectConnectedFollows(String userId) {
		SqlSession session = factory.openSession();

		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			return mapper.selectConnectedFollows(userId);
		} finally {
			session.close();
		}
	}

	@Override
	public Follow selectFollowById(String userId, String followId) {
		SqlSession session = factory.openSession();
		
		try{
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			System.out.println("followStoreLogic");
			System.out.println(userId);
			System.out.println(followId);
			System.out.println(mapper.selectFollowById(userId, followId).getUserId());
			System.out.println(mapper.selectFollowById(userId, followId).getFollowId());
			System.out.println(mapper.selectFollowById(userId, followId).getRelation());
			return mapper.selectFollowById(userId, followId);
		}finally{
			session.close();
		}
	}

}
