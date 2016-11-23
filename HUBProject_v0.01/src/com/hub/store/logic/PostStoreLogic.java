package com.hub.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.hub.domain.Post;
import com.hub.store.factory.SqlSessionFactoryProvider;
import com.hub.store.mapper.PostMapper;
import com.hub.store.pacade.PostStore;

@Repository
public class PostStoreLogic implements PostStore {

	private SqlSessionFactory factory;
	
	public PostStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insertPost(Post post) {
		SqlSession session = factory.openSession();
		int result=0;
		try{
			PostMapper mapper = session.getMapper(PostMapper.class);
			result = mapper.insertPost(post);
			if(result>0){
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
	public int deletePost(int postId) {
		SqlSession session = factory.openSession();
		int result=0;
		try{
			PostMapper mapper = session.getMapper(PostMapper.class);
			result = mapper.deletePost(postId);
			if(result>0){
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
	public List<Post> selectAll(String userId) {
		SqlSession session = factory.openSession();
		
		List<Post> list = null;
		try{
			PostMapper mapper = session.getMapper(PostMapper.class);
			list = mapper.selectAll(userId);
		}finally{
			session.close();
		}
		return list;
	}

	@Override
	public List<Post> selectPosts(String userId, String friendId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> selectSendPosts(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Post> selectReceivePosts(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

}
