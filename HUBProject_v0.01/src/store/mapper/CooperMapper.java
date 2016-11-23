package store.mapper;

import java.util.List;

import domain.Cooper;

public interface CooperMapper {
	
	int insertCooper(Cooper cooper);
	int updateCooper(Cooper cooper);
	int deleteCooper(int coId);
	List<Cooper> selectAll();
	Cooper selectCooperByCoId(int coId);
	List<Cooper> selectCoopersByConnChain(String connChain);
}
