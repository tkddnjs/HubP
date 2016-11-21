package store.mapper;

import java.util.List;

public interface ConnChainMapper {

	int insertConnChain(String connChain);
	List<String> selectConnChains();
}
