package com.hub.service.pacade;

import com.hub.domain.User;

public interface UserService {
	
	// User 등록
	int registerUser(User user);
	
	// User 수정
	int modifyUser(User user);
	
	// User 삭제
	int removeUser(String userId);
	
	// User 조회
	User findUserByUserId(String userId);
	
	boolean login(User user);
	boolean checkId(String userId);
	boolean getIsAdmin();
}
