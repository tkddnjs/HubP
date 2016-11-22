package store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import domain.Follow;
import store.factory.SqlSessionFactoryProvider;
import store.mapper.FollowMapper;
import store.pacade.FollowStore;

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
		temp.setRelation((3-follow.getRelation())%3);
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
	public int updateFollowConfirm(Follow follow) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			result = mapper.updateFollowConfirm(follow);
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
	public List<Follow> selectRequestedFollows(String userId) {
		SqlSession session = factory.openSession();
		
		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			return mapper.selectRequestedFollows(userId);
		} finally {
			session.close();
		}
	}
	
	@Override
	public List<Follow> selectFollowsByConnChain(String userId, String connChain) {
		SqlSession session = factory.openSession();

		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			return mapper.selectFollowsByConnChain(userId, connChain);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Follow> selectFollowsByRelation(Follow follow) {
		SqlSession session = factory.openSession();

		try {
			FollowMapper mapper = session.getMapper(FollowMapper.class);
			return mapper.selectFollowsByRelation(follow);
		} finally {
			session.close();
		}
	}



}
