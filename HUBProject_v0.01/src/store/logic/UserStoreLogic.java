package store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import domain.User;
import store.factory.SqlSessionFactoryProvider;
import store.mapper.UserMapper;
import store.pacade.UserStore;

public class UserStoreLogic implements UserStore {
	
	private SqlSessionFactory factory;
	
	public UserStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insertUser(User user) {
		SqlSession session = factory.openSession();
		int result = 0;
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			result = mapper.insertUser(user);
			
			if(result == 0){
				session.rollback();
				return result;
			}
			
			for(String connChain : user.getConnChains()){
				result *= mapper.insertConnChain(user.getUserId(), connChain);
			}
			
			if(result > 0){
				session.commit();
			}else{
				session.rollback();
			}
		}finally{
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
			if(result > 0){
				session.commit();
			} else{
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
			if(result > 0){
				session.commit();
			} else{
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
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			user=mapper.selectUserByUserId(userId);
		}finally{
			session.close();
		}
		return user;
	}

	@Override
	public List<User> selectUsersByConnChains(List<String> connChains) {
		SqlSession session = factory.openSession();
		try{
			UserMapper mapper = session.getMapper(UserMapper.class);
			return mapper.selectUsersByConnChains(connChains);
		}finally{
			session.close();
		}
	}
}



















