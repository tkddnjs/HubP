package com.hub.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.domain.User;
import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.UserMapper;
import com.hub.store.pacade.UserStore;

@Repository
public class UserStoreLogic implements UserStore {

	private SqlSessionFactory factory;

	public UserStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}

	@Override
	public int insertUser(User user) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.insertUser(user);

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
	public int insertUserConn(User user) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);

			for (String connChain : user.getConnChains()) {
				result *= mapper.insertUserConn(user.getUserId(), connChain);
			}

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
	public int updateUser(User user) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.updateUser(user);
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
	public int deleteUser(String userId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.deleteUser(userId);
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
	public int deleteUserConn(String userId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.deleteUserConn(userId);
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
	public User selectUser(String userId) {
		SqlSession session = factory.openSession();
		User user = null;
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			user = mapper.selectUserByUserId(userId);
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public List<User> selectUsersByConnChain(String connChain) {
		SqlSession session = factory.openSession();
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			return mapper.selectUsersByConnChain(connChain);
		} finally {
			session.close();
		}
	}

	@Override
	public List<User> selectUsersByConnChains(List<String> connChains) {
		SqlSession session = factory.openSession();
		
		try {
			UserMapper mapper = session.getMapper(UserMapper.class);
			return mapper.selectUsersByConnChains(connChains);
		} finally{
			session.close();
		}
	}
	
	
}
