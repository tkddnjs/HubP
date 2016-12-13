package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.User;

public interface UserMapper {

	// user 등록
	int insertUser(User user);
	int insertUserConn(@Param("userId")String userId, @Param("connChain")String connChain);

	// user 수정
	int updateUser(User user);
	
	// user 삭제
	int deleteUser(String userId);
	int deleteUserConn(String userId);
	
	// user 조회
	User selectUserByUserId(String userId);
	List<User> selectUsersByConnChain(String connChain);
	
	List<User> selectUsersByConnChains(List<String> connChains);
	
	// user 객체에 connChains를 set
	List<String> selectConnChainsByUserId(String userId);
}
