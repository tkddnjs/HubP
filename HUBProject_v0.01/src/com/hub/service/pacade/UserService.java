package com.hub.service.pacade;

import com.hub.domain.User;

public interface UserService {

	int registerUser(User user);
	int modifyUser(User user);
	int removeUser(String userId);
	User findUserByUserId(String userId);
	boolean login(User user);
	boolean checkId(String userId);
	boolean getIsAdmin();
}
