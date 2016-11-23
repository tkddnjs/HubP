package com.hub.service.logic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.User;
import com.hub.service.pacade.UserService;
import com.hub.store.logic.ConnChainStoreLogic;
import com.hub.store.logic.UserStoreLogic;
import com.hub.store.pacade.ConnChainStore;
import com.hub.store.pacade.UserStore;

@Service
public class UserServiceLogic implements UserService {

	@Autowired
	private UserStore userStore;
	@Autowired
	private ConnChainStore connChainStore;
	private boolean isAdmin;
	
	public UserServiceLogic() {
		userStore = new UserStoreLogic();
		connChainStore = new ConnChainStoreLogic();
	}
	
	@Override
	public int registerUser(User user) {
		int result = 1;
		
		result *= userStore.insertUser(user);
		
		List<String> sList = new ArrayList<>();
		for(String connChain : user.getConnChains()){
			if(!connChainStore.selectConnChains().contains(connChain)){
				sList.add(connChain);
			}
		}
		System.out.println(sList);
		for(String connChain : sList){
			result *= connChainStore.insertConnChain(connChain);
		}
		
		return result;
	}

	@Override
	public int modifyUser(User user) {
		return userStore.updateUser(user);
	}

	@Override
	public int removeUser(String userId) {
		return userStore.deleteUser(userId);
	}

	@Override
	public User findUserByUserId(String userId) {
		return userStore.selectUser(userId);
	}

	@Override
	public boolean login(User user) {
		User checkUser = userStore.selectUser(user.getUserId());
		
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
		if(userStore.selectUser(userId) == null){
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
