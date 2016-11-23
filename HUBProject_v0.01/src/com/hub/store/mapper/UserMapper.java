package com.hub.store.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hub.domain.User;

public interface UserMapper {

	int insertUser(User user);
	int updateUser(User user);
	int deleteUser(String userId);
	User selectUserByUserId(String userId);
	List<User> selectUsersByConnChain(String connChain);
	List<String> selectConnChainsByUserId(String userId);
	
	int insertConnChain(@Param("userId")String userId, @Param("connChain")String connChain);
}
