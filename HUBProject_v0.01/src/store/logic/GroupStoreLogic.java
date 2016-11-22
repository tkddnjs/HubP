package store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import domain.Group;
import store.factory.SqlSessionFactoryProvider;
import store.pacade.GroupStore;

@Repository
public class GroupStoreLogic implements GroupStore {

	private SqlSessionFactory factory;
	
	public GroupStoreLogic() {
		factory = SqlSessionFactoryProvider.getSqlSessionFactory();
	}
	
	@Override
	public int insertGroup(Group group) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGroup(Group group) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteGroup(int groupId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertUserGroup(int groupId, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUserGroup(int groupId, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Group> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Group selectGroupByGroupId(int groupId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> selectGroupsByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> selectGroupsByConnChain(String ConnChain) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> selectGroupsByGroupName(String groupName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Group> selectGroupsByLocal(String local) {
		// TODO Auto-generated method stub
		return null;
	}

}
