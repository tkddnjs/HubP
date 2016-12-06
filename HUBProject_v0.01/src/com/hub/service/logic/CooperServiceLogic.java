package com.hub.service.logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hub.domain.Cooper;
import com.hub.service.pacade.CooperService;
import com.hub.store.pacade.ConnChainStore;
import com.hub.store.pacade.CooperStore;

@Service
public class CooperServiceLogic implements CooperService {

	@Autowired
	private CooperStore cooperStore;
	@Autowired
	private ConnChainStore connChainStore;
	
	@Override
	public int registerCooper(Cooper cooper) {
		int result = 1;
		cooper.setCoId(cooperStore.nextCooperId());
		
		result *= cooperStore.insertCooper(cooper);
		result *= cooperStore.insertCooperConn(cooper);
		
		List<String> sList = cooper.getConnChains();
		sList.removeAll(connChainStore.selectConnChains());
		
		for(String connChain : sList){
			result *= connChainStore.insertConnChain(connChain);
		}
		
		return result;
	}

	@Override
	public int modifyCooper(Cooper cooper) {
		int result = 1;
		
		result *= cooperStore.updateCooper(cooper);
		result *= cooperStore.deleteCooperConn(cooper.getCoId());
		result *= cooperStore.insertCooperConn(cooper);
		
		return result;
	}

	@Override
	public int removeCooper(int coId) {
		return cooperStore.deleteCooper(coId);
	}

	@Override
	public List<Cooper> findAll() {
		return cooperStore.selectAll();
	}

	@Override
	public Cooper findCooperByCoId(int coId) {
		return cooperStore.selectCooperByCoId(coId);
	}

	@Override
	public List<Cooper> findCoopersByConnChain(String connChain) {
		return cooperStore.selectCoopersByConnChain(connChain);
	}

}
