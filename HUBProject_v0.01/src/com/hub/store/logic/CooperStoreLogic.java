package com.hub.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.domain.Cooper;
import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.CooperMapper;
import com.hub.store.pacade.CooperStore;

@Repository
public class CooperStoreLogic implements CooperStore {

	private SqlSessionFactory factory;
	
	public CooperStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insertCooper(Cooper cooper) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			CooperMapper mapper = session.getMapper(CooperMapper.class);
			result = mapper.insertCooper(cooper);
			if(result > 0){
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
	public int updateCooper(Cooper cooper) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			CooperMapper mapper = session.getMapper(CooperMapper.class);
			result = mapper.updateCooper(cooper);
			if(result > 0){
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
	public int deleteCooper(int coId) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			CooperMapper mapper = session.getMapper(CooperMapper.class);
			result = mapper.deleteCooper(coId);
			if(result > 0){
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
	public List<Cooper> selectAll() {
		SqlSession session = factory.openSession();
		try {
			CooperMapper mapper = session.getMapper(CooperMapper.class);
			return mapper.selectAll();
		} finally {
			session.close();
		}
	}

	@Override
	public Cooper selectCooperByCoId(int coId) {
		SqlSession session = factory.openSession();
		try {
			CooperMapper mapper = session.getMapper(CooperMapper.class);
			return mapper.selectCooperByCoId(coId);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Cooper> selectCoopersByConnChain(String connChain) {
		SqlSession session = factory.openSession();
		try {
			CooperMapper mapper = session.getMapper(CooperMapper.class);
			return mapper.selectCoopersByConnChain(connChain);
		} finally {
			session.close();
		}
	}

}
