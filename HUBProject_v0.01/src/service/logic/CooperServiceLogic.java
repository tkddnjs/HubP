package service.logic;

import java.util.List;

import org.springframework.stereotype.Service;

import domain.Cooper;
import service.pacade.CooperService;
import store.logic.CooperStoreLogic;
import store.pacade.CooperStore;

@Service
public class CooperServiceLogic implements CooperService {

	private CooperStore store;
	
	public CooperServiceLogic(){
		store = new CooperStoreLogic();
	}
	
	@Override
	public int registerCooper(Cooper cooper) {
		return store.insertCooper(cooper);
	}

	@Override
	public int modifyCooper(Cooper cooper) {
		return store.updateCooper(cooper);
	}

	@Override
	public int removeCooper(int coId) {
		return store.deleteCooper(coId);
	}

	@Override
	public List<Cooper> findAll() {
		return store.selectAll();
	}

	@Override
	public Cooper findCoopersByCoId(int coId) {
		return store.selectCooperByCoId(coId);
	}

}
