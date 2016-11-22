package store.pacade;

import java.util.List;

import domain.User;

public interface UserStore {

	int insertUser(User user);
	int updateUser(User user);
	int deleteUser(String userId);
	User selectUser(String userId);
	
	List<User> selectUsersByConnChain(String connChain);
}
