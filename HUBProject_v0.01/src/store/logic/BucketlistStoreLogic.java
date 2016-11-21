package store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import domain.Bucketlist;
import store.factory.SqlSessionFactoryProvider;
import store.mapper.BucketlistMapper;
import store.pacade.BucketlistStore;

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
	public List<Bucketlist> selectBucketlistsByConnChains(List<String> connChains) {
		SqlSession session = factory.openSession();
		
		try {
			BucketlistMapper mapper = session.getMapper(BucketlistMapper.class);
			return mapper.selectBucketlistsByConnChains(connChains);
		} finally {
			session.close();
		}
	}

}
