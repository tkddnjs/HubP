package store.logic;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import domain.User;
import store.pacade.UserStore;

public class UserStoreLogicTest {

	private UserStore store;
	
	
	@Before
	public void init(){
		store = new UserStoreLogic(); 
	}
	
//	@Test
//	public void testInsertUser() {
//		User user = new User();
//		user.setUserId("감자먹기대회");
//		user.setAdmin(false);
//		user.setPicture("picture.jpg");
//		user.setPw("asasd");
//		user.setEmail("email@coa.com");
//		user.setListOption(3);
//		user.setIntroduce("asdafafqegscvwhqefahegsg");
//		
//		List<String> connChains = new ArrayList<>();
//		connChains.add("공원산책하기");
//		connChains.add("감자먹기");
//		user.setConnChains(connChains);
//		
//		assertEquals(1, store.insertUser(user));
//	}
//
//	@Test
//	public void testUpdateUser() {
//		fail("Not yet implemented");
//	}
//
//	@Test
//	public void testDeleteUser() {
//		fail("Not yet implemented");
//
//	@Test
//	public void testSelectUser() {
//		User user = store.selectUser("bookstore");
//		
//		
//		assertNotNull(user);
//		assertEquals("bookstore", user.getUserId());
//		//assertEquals("111", store.selectUser(user.getPw()));
//	}
//
//	@Test
//	public void testSelectUsersByConnChains() {
//		List<String> connChains = new ArrayList<>();
//		connChains.add("asdf");
//		
//		List<User> users = store.selectUsersByConnChains(connChains);
//		
//		assertEquals(2, users.size());
//		assertEquals("asd", users.get(0).getUserId());
//		assertEquals("asd", users.get(1).getUserId());
//	}

}
