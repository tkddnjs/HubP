package com.hub.store.pacade;

import java.util.List;

public interface ConnChainStore {

	int insertConnChain(String connChain);
	List<String> selectConnChains();
}
