package com.hub.store.pacade;

import java.util.List;

import com.hub.domain.User;

public interface UserStore {

	// user 등록
	int insertUser(User user);
	int insertUserConn(User user);
	
	// user 수정
	int updateUser(User user);
	
	// user 삭제
	int deleteUser(String userId);
	int deleteUserConn(String userId);

	// user 조회
	User selectUser(String userId);
	List<User> selectUsersByConnChain(String connChain);
	
	List<User> selectUsersByConnChains(List<String> connChains);
}
