package store.logic;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import domain.Bucketlist;
import store.pacade.BucketlistStore;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class BucketlistStoreLogicTest {

	private BucketlistStore store;
	
	@Before
	public void init(){
		store = new BucketlistStoreLogic();
	}
	
//	@Test
//	public void test1InsertBucketlist() {
//		Bucketlist bucketlist = new Bucketlist();
//		
//		bucketlist.setGoal("123");
//		bucketlist.setLock(true);
//		bucketlist.setMemo("14");
//		bucketlist.setSos("asgw");
//		bucketlist.setStar(5);
//		bucketlist.setTitle("hqeat");
//		bucketlist.setUserId("이유저");
//		
//		assertEquals(1, store.insertBucketlist(bucketlist));
//	}
//
//	@Test
//	public void test2UpdateBucketlist() {
//		Bucketlist bucketlist = new Bucketlist();
//		
//		bucketlist.setBucketlistId(3);
//		bucketlist.setGoal("asdgg");
//		bucketlist.setLock(true);
//		bucketlist.setMemo("asde");
//		bucketlist.setSos("asgwe");
//		bucketlist.setStar(5);
//		bucketlist.setTitle("asdafg");
//		bucketlist.setUserId("김유저");
//		
//		assertEquals(1, store.updateBucketlist(bucketlist));
//		assertEquals("asde", store.selectBucketlistByBucketlistId(3).getMemo());
//		assertEquals("asdgg", store.selectBucketlistByBucketlistId(3).getGoal());
//		
//	}
//
//	@Test
//	public void test3DeleteBucketlist() {
//		assertEquals(1, store.deleteBucketlist(3));
//	}
//	
//	@Test
//	public void test4SelectAll() {
//		List<Bucketlist> bList = store.selectAll();
//		assertEquals(2, bList.size());
//		assertEquals("이유저", bList.get(0).getUserId());
//		
//	}
//
//	@Test
//	public void test5SelectBucketlistByBucketlistId() {
//		assertNotNull(store.selectBucketlistByBucketlistId(1));
//		assertNotNull(store.selectBucketlistByBucketlistId(2));
//		assertEquals("김유저", store.selectBucketlistByBucketlistId(1).getUserId());
//		assertEquals("이유저", store.selectBucketlistByBucketlistId(2).getUserId());
//		
//	}
//
//	@Test
//	public void test6SelectBucketlistsByConnChains() {
//		List<String> connChains = new ArrayList<>();
//		
//		connChains.add("여행");
//		List<Bucketlist> bList = store.selectBucketlistsByConnChains(connChains); 
//		assertEquals(1, bList.size());
//		assertEquals(1, bList.get(0).getBucketlistId());
//		assertEquals("여행", bList.get(0).getConnChains().get(0));
//		assertEquals("hub", bList.get(0).getUserId());
//	}

}
