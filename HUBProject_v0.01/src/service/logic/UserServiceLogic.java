package service.logic;

import java.util.ArrayList;
import java.util.List;

import domain.User;
import service.pacade.UserService;
import store.logic.ConnChainStoreLogic;
import store.logic.UserStoreLogic;
import store.pacade.ConnChainStore;
import store.pacade.UserStore;

public class UserServiceLogic implements UserService {

	private UserStore store;
	private ConnChainStore ccStore;
	private boolean isAdmin;
	
	public UserServiceLogic() {
		store = new UserStoreLogic();
		ccStore = new ConnChainStoreLogic();
	}
	
	@Override
	public int registerUser(User user) {
		int result = 1;
		
		result *= store.insertUser(user);
		
		List<String> sList = new ArrayList<>();
		for(String connChain : user.getConnChains()){
			if(!ccStore.selectConnChains().contains(connChain)){
				sList.add(connChain);
			}
		}
		System.out.println(sList);
		for(String connChain : sList){
			result *= ccStore.insertConnChain(connChain);
		}
		
		return result;
	}

	@Override
	public int modifyUser(User user) {
		return store.updateUser(user);
	}

	@Override
	public int removeUser(String userId) {
		return store.deleteUser(userId);
	}

	@Override
	public User findUserByUserId(String userId) {
		return store.selectUser(userId);
	}

	@Override
	public boolean login(User user) {
		User checkUser = store.selectUser(user.getUserId());
		
		if(checkUser != null){
			if(user.getPw().equals(checkUser.getPw())){
				isAdmin = checkUser.isAdmin();
				return true;
			} else{
				return false;
			}
		}else{
			throw new RuntimeException("아이디를 잘못입력했습니다.");
		}
	}

	@Override
	public boolean checkId(String userId) {
		if(store.selectUser(userId) == null){
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean getIsAdmin(){
		return isAdmin;
	}
}
