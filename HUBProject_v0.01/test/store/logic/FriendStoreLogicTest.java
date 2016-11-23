package store.logic;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import com.hub.store.logic.FollowStoreLogic;
import com.hub.store.pacade.FollowStore;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class FriendStoreLogicTest {

	private FollowStore store;
	
	@Before
	public void init(){
		store = new FollowStoreLogic();
	}
	
	
//	@Test
//	public void test1InsertFriend() {
//		Friend friend = new Friend();
//		
//		friend.setUserId("3");
//		friend.setFriendId("5");
//		friend.setRelation(3);
//		
//		assertEquals(1, store.insertFriend(friend));
//	}
//
//	@Test
//	public void test2DeleteFriend() {
//		Friend friend = new Friend();
//		
//		friend.setUserId("3");
//		friend.setFriendId("5");
//		
//		assertEquals(2, store.deleteFriend(friend));
//	}
//
//	@Test
//	public void test3SelectAll() {
//		assertEquals(3, store.selectAll("1").size());
//	}
//
//	@Test
//	public void test4SelectFriendsByConnChains() {
//
//		assertEquals(2, store.selectFriendsByConnChain("1", "123").size());
//		assertEquals(1, store.selectFriendsByConnChain("1", "234").size());
//	}
//
//	@Test
//	public void test5SelectFriendsByRelation() {
//		Friend friend = new Friend();
//		
//		friend.setUserId("1");
//		friend.setRelation(1);
//		
//		assertEquals(3, store.selectFriendsByRelation(friend).size());
//	
//	}

}
