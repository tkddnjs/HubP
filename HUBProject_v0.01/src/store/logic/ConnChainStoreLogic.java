package store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import store.factory.SqlSessionFactoryProvider;
import store.mapper.ConnChainMapper;
import store.pacade.ConnChainStore;

public class ConnChainStoreLogic implements ConnChainStore {

	private SqlSessionFactory factory;
	
	public ConnChainStoreLogic(){
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insertConnChain(String connChain) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			ConnChainMapper mapper = session.getMapper(ConnChainMapper.class);
			result = mapper.insertConnChain(connChain);
			
			if(result>0){
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
	public List<String> selectConnChains() {
		SqlSession session = factory.openSession();
		try {
			ConnChainMapper mapper = session.getMapper(ConnChainMapper.class);
			return mapper.selectConnChains();
			
		} finally {
			session.close();
		}
	}

}
