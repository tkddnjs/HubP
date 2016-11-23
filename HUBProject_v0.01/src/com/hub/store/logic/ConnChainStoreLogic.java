package com.hub.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.ConnChainMapper;
import com.hub.store.pacade.ConnChainStore;

@Repository
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
