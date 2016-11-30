package com.hub.service.pacade;

import java.util.List;

import com.hub.domain.Cooper;

public interface CooperService {

	int registerCooper(Cooper cooper);
	int modifyCooper(Cooper cooper);
	int removeCooper(int coId);
	List<Cooper> findAll();
	Cooper findCoopersByCoId(int coId);
	List<Cooper> findCoopersByConnChain(String connChain);
}
