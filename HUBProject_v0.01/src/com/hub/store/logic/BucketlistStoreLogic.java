package com.hub.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.domain.Bucketlist;
import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.BucketlistMapper;
import com.hub.store.pacade.BucketlistStore;

@Repository
public class BucketlistStoreLogic implements BucketlistStore {

	private SqlSessionFactory factory;
	
	public BucketlistStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int nextBucketlistId() {
		SqlSession session = factory.openSession();
		int nextBucketlistId = 0;
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			nextBucketlistId = mapper.nextBucketlistId();
		} finally {
			session.close();
		}
		return nextBucketlistId;
	}
	
	@Override
	public int insertBucketlistConn(Bucketlist bucketlist) {
		SqlSession session = factory.openSession();
		int result = 0;
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			
			for(String connChain : bucketlist.getConnChains()){
				result = mapper.insertBucketlistConn(bucketlist.getBucketlistId(), connChain);
			}	
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
	public int insertBucketlist(Bucketlist bucketlist) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			result = mapper.insertBucketlist(bucketlist);
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
	public int updateBucketlist(Bucketlist bucketlist) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);

			result = mapper.updateBucketlist(bucketlist);

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
	public int deleteBucketlistConn(int bucketlistId) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			result = mapper.deleteBucketlistConn(bucketlistId);
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
	public int deleteBucketlist(int bucketlistId) {
		SqlSession session = factory.openSession();
		int result = 0;
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			result = mapper.deleteBucketlist(bucketlistId);
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
	public List<Bucketlist> selectAll(String userId) {
		SqlSession session = factory.openSession();
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			return mapper.selectAll(userId);
		} finally {
			session.close();
		}
	}

	@Override
	public Bucketlist selectBucketlistByBucketlistId(int bucketlistId) {
		SqlSession session = factory.openSession();
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			return mapper.selectBucketlistByBucketlistId(bucketlistId);
		} finally {
			session.close();
		}
	}

	@Override
	public List<Bucketlist> selectBucketlistsByConnChain(String connChain) {
		SqlSession session = factory.openSession();
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			return mapper.selectBucketlistsByConnChain(connChain);
		} finally {
			session.close();
		}
	}

}
