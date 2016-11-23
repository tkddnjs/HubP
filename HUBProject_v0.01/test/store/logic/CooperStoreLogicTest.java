package store.logic;

import static org.junit.Assert.*;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.hub.domain.Cooper;
import com.hub.store.logic.CooperStoreLogic;
import com.hub.store.pacade.CooperStore;

public class CooperStoreLogicTest {

	private CooperStore store;
	
	@Before
	public void init(){
		store = new CooperStoreLogic();
	}
	
//	@Test
//	public void testInsertCooper() {
//		Cooper cooper = new Cooper();
//		
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyymmdd");
//		List<String> connChains = new ArrayList<>();
//		connChains.add("asdfg");
//		cooper.setCoName("asd");
//		cooper.setCoBanner("asdf");
//		try {
//			cooper.setLastDay(new Date(dateFormat.parse("19911027").getTime()));
//		} catch (ParseException e) {
//		}
////		cooper.setConnChains(connChains);
//		assertEquals(1, store.insertCooper(cooper));
//	}
	
/*
	@Test
	public void testUpdateCooper() {
		fail("Not yet implemented");
	}

	@Test
	public void testDeleteCooper() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testSelectCooperByCoId() {
		fail("Not yet implemented");
	}
*/
	
}
